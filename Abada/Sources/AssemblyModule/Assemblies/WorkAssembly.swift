import Foundation
import AbadaDI

// MARK: - WorkAssembly
final class WorkAssembly: Assembly {
    func assemble() {
        Container.shared.register(service: WorkRouter.self) { _ in
            WorkRouter()
        }

        Container.shared.register(service: WorkTableManager.self) { _ in
            WorkTableManager()
        }

        Container.shared.register(service: WorkPresenter.self) { resolve in
            let tableManager: WorkTableManager = resolve.resolve()
            let router: WorkRouter = resolve.resolve()
            return WorkPresenter(tableManager: tableManager, router: router)
        }

        Container.shared.register(service: WorkViewController.self) { resolve in
            let presenter: WorkPresenter = resolve.resolve()
            return WorkViewController(presenter: presenter)
        }

        @Dependency var presenter: WorkPresenter
        @Dependency var view: WorkViewController
        @Dependency var tableManager: WorkTableManager
        @Dependency var router: WorkRouter

        presenter.view = view
        tableManager.setup(tableView: view.tableView)
        router.view = view
    }
}
