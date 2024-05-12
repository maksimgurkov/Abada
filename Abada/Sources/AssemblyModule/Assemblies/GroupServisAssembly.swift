import Foundation
import AbadaDI

// MARK: - GroupServisAssembly
final class GroupServisAssembly: Assembly {

    private let viewModels: WorkGroupViewModel

    init(viewModels: WorkGroupViewModel) {
        self.viewModels = viewModels
    }

    func assemble() {
        Container.shared.register(service: GroupServisRouter.self) { _ in
            GroupServisRouter()
        }

        Container.shared.register(service: GroupServisTableManager.self) { _ in
            GroupServisTableManager()
        }

        Container.shared.register(service: GroupServisPresenter.self) { resolve in
            let tableManager: GroupServisTableManager = resolve.resolve()
            let router: GroupServisRouter = resolve.resolve()
            return GroupServisPresenter(
                tableManager: tableManager,
                viewModels: self.viewModels,
                router: router
            )
        }

        Container.shared.register(service: GroupServisViewController.self) { resolve in
            let presenter: GroupServisPresenter = resolve.resolve()
            return GroupServisViewController(presenter: presenter)
        }

        @Dependency var tableManager: GroupServisTableManager
        @Dependency var presenter: GroupServisPresenter
        @Dependency var view: GroupServisViewController
        @Dependency var router: GroupServisRouter

        presenter.view = view
        tableManager.setup(tableView: view.tableView)
        router.view = view
    }
}
