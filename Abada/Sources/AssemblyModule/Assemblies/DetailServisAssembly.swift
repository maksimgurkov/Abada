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

        Container.shared.register(service: DetailServisTableManager.self) { _ in
            DetailServisTableManager()
        }

        Container.shared.register(service: DetailServisPresenter.self) { resolve in
            let tableManager: DetailServisTableManager = resolve.resolve()
            let router: ApplicationRouter = resolve.resolve()
            return DetailServisPresenter(
                viewModel: self.viewModel,
                tableView: tableManager,
                router: router
            )
        }

        Container.shared.register(service: DetailServisViewController.self) { resolve in
            let presenter: DetailServisPresenter = resolve.resolve()
            return DetailServisViewController(presenter: presenter)
        }

        @Dependency var presenter: DetailServisPresenter
        @Dependency var view: DetailServisViewController
        @Dependency var tableView: DetailServisTableManager
        @Dependency var router: ApplicationRouter

        presenter.view = view
        tableView.setup(tableView: view.tableView)
        router.view = view
    }
}
