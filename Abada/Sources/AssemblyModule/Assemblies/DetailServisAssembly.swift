import Foundation
import AbadaDI

final class DetailServisAssembly: Assembly {

    var viewModel: DetailServisViewModel

    init(viewModel: DetailServisViewModel) {
        self.viewModel = viewModel
    }

    func assemble() {
        Container.shared.register(service: ApplicationRouter.self) { _ in
            ApplicationRouter()
        }

        Container.shared.register(service: DetailServiceTableManager.self) { _ in
            DetailServiceTableManager()
        }

        Container.shared.register(service: DetailServicePresenter.self) { resolve in
            let tableManager: DetailServiceTableManager = resolve.resolve()
            let router: ApplicationRouter = resolve.resolve()
            return DetailServicePresenter(
                viewModel: self.viewModel,
                tableView: tableManager,
                router: router
            )
        }

        Container.shared.register(service: DetailServiceViewController.self) { resolve in
            let presenter: DetailServicePresenter = resolve.resolve()
            return DetailServiceViewController(presenter: presenter)
        }

        @Dependency var presenter: DetailServicePresenter
        @Dependency var view: DetailServiceViewController
        @Dependency var tableView: DetailServiceTableManager
        @Dependency var router: ApplicationRouter

        presenter.view = view
        tableView.setup(tableView: view.tableView)
        router.view = view
    }
}
