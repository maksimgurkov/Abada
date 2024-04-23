import Foundation
import AbadaDI

final class GroupDetailAssembly: Assembly {

    var viewModel: GroupViewModel

    init(viewModel: GroupViewModel) {
        self.viewModel = viewModel
    }

    func assemble() {
        Container.shared.register(service: ApplicationRouter.self) { _ in
            ApplicationRouter()
        }

        Container.shared.register(service: DetailServisTableManager.self) { _ in
            DetailServisTableManager()
        }

        Container.shared.register(service: DetailGroupPresenter.self) { resolve in
            let tableManager: DetailServisTableManager = resolve.resolve()
            let router: ApplicationRouter = resolve.resolve()
            return DetailGroupPresenter(
                viewModel: self.viewModel,
                tableView: tableManager,
                router: router
            )
        }

        Container.shared.register(service: DetailGroupViewController.self) { resolve in
            let presenter: DetailGroupPresenter = resolve.resolve()
            return DetailGroupViewController(presenter: presenter)
        }

        @Dependency var presenter: DetailGroupPresenter
        @Dependency var view: DetailGroupViewController
        @Dependency var tableView: DetailServisTableManager
        @Dependency var router: ApplicationRouter

        presenter.view = view
        tableView.setup(tableView: view.tableView)
        router.view = view
    }
}
