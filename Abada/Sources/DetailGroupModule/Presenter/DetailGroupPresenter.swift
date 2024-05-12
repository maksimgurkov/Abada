import UIKit
import RealmSwift
// swiftlint:disable force_try

// MARK: - DetailGroupPresenter
final class DetailGroupPresenter {

    let realm = try! Realm()
    weak var view: DetailGroupInput?

    private let viewModel: GroupViewModel
    private let tableManager: DetailServisTableManagerProtocol

    private let router: ApplicationRouterProtocol

    init(viewModel: GroupViewModel, tableView: DetailServisTableManagerProtocol, router: ApplicationRouterProtocol) {
        self.viewModel = viewModel
        self.tableManager = tableView
        self.router = router
    }
}

// MARK: - DetailGroupPresenterProtocol
extension DetailGroupPresenter: DetailGroupPresenterProtocol {

    func viewDidLoad() {
        createViewModel(viewModel: viewModel)
    }

    func getTitle(_ title: UILabel) {
        title.text = viewModel.title
    }
}

// MARK: - DetailGroupPresenter
private extension DetailGroupPresenter {
    func createViewModel(viewModel: GroupViewModel) {
        var viewModels = [DetailTypeCell]()

        let photoViewModel: DetailTypeCell = .image(.init(nameImage: viewModel.image))
        viewModels.append(photoViewModel)

        let titleViewModel: DetailTypeCell = .title(.init(
            text: viewModel.title,
            systemName: setIconButton(),
            didTap: { [weak self] in
                self?.toggleDataRealm(viewModel: viewModel)
            }
        ))
        viewModels.append(titleViewModel)

        let articleViewModel: DetailTypeCell = .article(.init(text: viewModel.description))
        viewModels.append(articleViewModel)

        let priceViewModel: DetailTypeCell = .price(.init(amount: viewModel.price))
        viewModels.append(priceViewModel)

        let requestViewModel: DetailTypeCell = .button(.init(title: "Подать заявку", didTap: {
            self.router.routerToApplication()
        }))
        viewModels.append(requestViewModel)

        let callViewModel: DetailTypeCell = .button(.init(title: "Позвонить", didTap: {
            if let url = URL(string: "tel://89261356825") {
                UIApplication.shared.open(url)
            }
        }))
        viewModels.append(callViewModel)

        DispatchQueue.main.async {
            self.tableManager.update(viewModel: viewModels)
        }
    }

    private func toggleDataRealm(viewModel: GroupViewModel) {
        let realmData = realm.objects(WishViewModelRealm.self).filter("title == %@", viewModel.title)

        do {
            try realm.write {
                if realmData.isEmpty {
                    let worksDataRealm = WishViewModelRealm()
                    worksDataRealm.image = viewModel.image
                    worksDataRealm.title = viewModel.title
                    worksDataRealm.detailArticle = viewModel.description
                    worksDataRealm.amount = viewModel.price
                    realm.add(worksDataRealm)
                    print("Добавлено в Realm")
                } else {
                    realm.delete(realmData)
                    print("Удалено из Realm")
                }
            }
        } catch { }
    }

    private func setIconButton() -> String {
        realm.objects(WishViewModelRealm.self).filter("title == %@", viewModel.title).isEmpty ? "heart" : "heart.fill"
    }
}
