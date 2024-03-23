import Foundation
import AbadaDI

// MARK: - NewsAssembly
final class NewsAssembly: Assembly {
    func assemble() {
        Container.shared.register(service: NewsDetailRouter.self) { _ in
            NewsDetailRouter()
        }

        Container.shared.register(service: NewsTableManager.self) { _ in
            NewsTableManager()
        }
        Container.shared.register(service: NewsPresenter.self) { resolve in
            let tableManager: NewsTableManager = resolve.resolve()
            let router: NewsDetailRouter = resolve.resolve()
            return NewsPresenter(tableManager: tableManager, router: router)
        }

        Container.shared.register(service: NewsViewController.self) { resolve in
            let presenter: NewsPresenter = resolve.resolve()
            return NewsViewController(presenter: presenter)
        }

        @Dependency var presenter: NewsPresenter
        @Dependency var view: NewsViewController
        @Dependency var tableManager: NewsTableManager
        @Dependency var router: NewsDetailRouter

        presenter.view = view
        tableManager.setup(tableView: view.tableView)
        router.view = view
    }

}
