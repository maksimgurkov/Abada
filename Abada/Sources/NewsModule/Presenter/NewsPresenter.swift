import Foundation

// MARK: - NewsPresenter
final class NewsPresenter {
    weak var view: NewsInput?

    // MARK: - Private properties
    private let tableManager: NewsTableManagerProtocol
    private let router: NewsDetailRouterProtocol
    private let viewModels = NewsData.shared.news

    // MARK: - Initialisers
    init(tableManager: NewsTableManagerProtocol, router: NewsDetailRouterProtocol) {
        self.tableManager = tableManager
        self.router = router
    }
}

// MARK: - NewsPresenterProtocol
extension NewsPresenter: NewsPresenterProtocol {
    func viewDidLoad() {
        view?.viewTitle("Новости")
        createViewModel(viewModels: viewModels)
    }
}

// MARK: - Setting
private extension NewsPresenter {
    func createViewModel(viewModels: [NewsModel]) {
        var models = [NewsViewModel]()

        viewModels.forEach {
            let viewModel = NewsViewModel(
                image: $0.image,
                title: $0.title,
                subTitle: $0.subTitle) {
                self.router.routerToNewsDetail()
            }
            models.append(viewModel)
        }

        DispatchQueue.main.async {
            self.tableManager.update(viewModels: models)
        }
    }
}
