import UIKit
import RealmSwift
// swiftlint:disable force_try

// MARK: - DetailServisPresenter
final class DetailServisPresenter {

    let realm = try! Realm()
    weak var view: DetailServisInput?

    private let viewModel: DetailServisViewModel
    private let tableManager: DetailServisTableManagerProtocol

    private let router: ApplicationRouterProtocol

    init(viewModel: DetailServisViewModel, tableView: DetailServisTableManagerProtocol, router: ApplicationRouterProtocol) {
        self.viewModel = viewModel
        self.tableManager = tableView
        self.router = router
    }
}

// MARK: - DetailGroupPresenterProtocol
extension DetailServisPresenter: DetailServisPresenterProtocol {

    func viewDidLoad() {
        createViewModel(viewModel: viewModel)
    }

    func getTitle(_ title: UILabel) {
        title.text = viewModel.title
    }
}

// MARK: - DetailServisPresenter
private extension DetailServisPresenter {
    func createViewModel(viewModel: DetailServisViewModel) {
        var viewModels = [DetailServisTypeCell]()

        let photoViewModel: DetailServisTypeCell = .image(.init(nameImage: viewModel.image))
        viewModels.append(photoViewModel)

        let titleViewModel: DetailServisTypeCell = .title(.init(
            text: viewModel.title,
            systemName: setIconButton(),
            didTap: { [weak self] in
                self?.toggleDataRealm(viewModel: viewModel)
            }
        ))
        viewModels.append(titleViewModel)

        let articleViewModel: DetailServisTypeCell = .article(.init(text: viewModel.detailArticle))
        viewModels.append(articleViewModel)

        let priceViewModel: DetailServisTypeCell = .price(.init(price: viewModel.price))
        viewModels.append(priceViewModel)

        let requestViewModel: DetailServisTypeCell = .button(.init(title: "Подать заявку", didTap: {
            self.router.routerToApplication()
        }))
        viewModels.append(requestViewModel)

        let callViewModel: DetailServisTypeCell = .button(.init(title: "Позвонить", didTap: {
            if let url = URL(string: "tel://89261356825") {
                UIApplication.shared.open(url)
            }
        }))
        viewModels.append(callViewModel)

        DispatchQueue.main.async {
            self.tableManager.update(viewModel: viewModels)
        }
    }

    private func toggleDataRealm(viewModel: DetailServisViewModel) {
        let realmData = realm.objects(WishViewModelRealm.self).filter("title == %@", viewModel.title)

        do {
            try realm.write {
                if realmData.isEmpty {
                    let worksDataRealm = WishViewModelRealm()
                    worksDataRealm.image = viewModel.image
                    worksDataRealm.title = viewModel.title
                    worksDataRealm.detailArticle = viewModel.detailArticle
                    worksDataRealm.price = viewModel.price
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
