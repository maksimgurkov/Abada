import UIKit
import RealmSwift
// swiftlint:disable force_try

// MARK: - DetailServisPresenter
final class DetailServisPresenter {

    weak var view: DetailServisInput?

    private let viewModel: DetailServisViewModel
    private let tableManager: DetailServisTableManagerProtocol
    private let router: ApplicationRouterProtocol

    init(viewModel: DetailServisViewModel, tableView: DetailServisTableManagerProtocol, router: ApplicationRouterProtocol) {
        self.viewModel = viewModel
        self.tableManager = tableView
        self.router = router
    }

    let realmData = StorageManager.shared.realm.objects(WishViewModelRealm.self)
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
        let services = realmData.filter("title == %@", viewModel.title)

        if services.isEmpty {
            let servisDataRealm = WishViewModelRealm()
            servisDataRealm.image = viewModel.image
            servisDataRealm.title = viewModel.title
            servisDataRealm.detailArticle = viewModel.detailArticle
            servisDataRealm.price = viewModel.price
            StorageManager.shared.save(servisDataRealm)
        } else {
            for service in services {
                StorageManager.shared.delete(service)
            }
        }
    }

    private func setIconButton() -> String {
        realmData.isEmpty ? "heart" : "heart.fill"
    }
}
