import UIKit

// MARK: - NewsDetailPresenter
final class NewsDetailPresenter {

    weak var view: NewsDetailInput?

    // MARK: - Private properties
    private let viewModel: DetailViewModel
    private let tableManager: NewsDetailTableManagerProtocol
    private let router: ApplicationRouterProtocol

    // MARK: - Initialisers
    init(
        viewModel: DetailViewModel,
        tableManager: NewsDetailTableManagerProtocol,
        router: ApplicationRouterProtocol
    ) {
        self.viewModel = viewModel
        self.tableManager = tableManager
        self.router = router
    }
}

// MARK: - NewsDetailPresenterProtocol
extension NewsDetailPresenter: NewsDetailPresenterProtocol {
    func viewDidLoad() {
        view?.updateView(viewModel: viewModel)
        createViewModel(viewModel: viewModel)
    }
}

// MARK: - Private extension
private extension NewsDetailPresenter {
    func createViewModel(viewModel: DetailViewModel) {
        var viewModels = [NewsTypeCell]()

        let imageModel: NewsTypeCell = .newsImage(.init(image: viewModel.image))
        viewModels.append(imageModel)

        let descriptionModel: NewsTypeCell = .newsDescription(.init(description: viewModel.description))
        viewModels.append(descriptionModel)

        let newsButtonViewModel: NewsTypeCell = .newsButton(
            .init(
                title: "Подать заявку",
                didTup: {
                    self.router.routerToApplication()
                }
            )
        )
        viewModels.append(newsButtonViewModel)

        let phoneButton: NewsTypeCell = .newsButton(.init(title: "Позвонить", didTup: {
            if let url = URL(string: "tel://89261356825") {
                UIApplication.shared.open(url)
            }
        }))
        viewModels.append(phoneButton)

        DispatchQueue.main.async {
            self.tableManager.update(viewModels: viewModels)
        }
    }
}
