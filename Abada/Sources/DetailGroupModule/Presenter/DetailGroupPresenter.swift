import UIKit
import RealmSwift

// MARK: - DetailGroupPresenter
final class DetailGroupPresenter {
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

        let titleViewModel: DetailTypeCell = .title(.init(text: viewModel.title, systemName: "heart", didTup: {
            print("Кнопка favoriteButton нажата")
        }))
        viewModels.append(titleViewModel)

        let articleViewModel: DetailTypeCell = .article(.init(text: viewModel.description))
        viewModels.append(articleViewModel)

        let priceViewModel: DetailTypeCell = .price(.init(amount: viewModel.price))
        viewModels.append(priceViewModel)

        let requestViewModel: DetailTypeCell = .button(.init(title: "Подать заявку", didTup: {
            self.router.routerToApplication()
        }))
        viewModels.append(requestViewModel)

        let callViewModel: DetailTypeCell = .button(.init(title: "Позвонить", didTup: {
            if let url = URL(string: "tel://89261356825") {
                UIApplication.shared.open(url)
            }
        }))
        viewModels.append(callViewModel)

        DispatchQueue.main.async {
            self.tableManager.update(viewModel: viewModels)
        }
    }
}
