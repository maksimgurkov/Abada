import Foundation
import AbadaDI

// MARK: - NewsDetailAssembly
final class NewsDetailAssembly: Assembly {

    var viewModel: DetailViewModel

    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
    }

    func assemble() {
        Container.shared.register(service: NewsDetailTableManager.self) { _ in
            NewsDetailTableManager()
        }

        Container.shared.register(service: NewsDetailPresenter.self) { resolve in
            let tableManager: NewsDetailTableManager = resolve.resolve()
            return NewsDetailPresenter(viewModel: self.viewModel, tableManager: tableManager)
        }

        Container.shared.register(service: NewsDetailViewController.self) { resolve in
            let presenter: NewsDetailPresenter = resolve.resolve()
            return NewsDetailViewController(presenter: presenter)
        }

        @Dependency var presenter: NewsDetailPresenter
        @Dependency var view: NewsDetailViewController
        @Dependency var tableManager: NewsDetailTableManager

        presenter.view = view
        tableManager.setup(tableView: view.tableView)
    }
}
