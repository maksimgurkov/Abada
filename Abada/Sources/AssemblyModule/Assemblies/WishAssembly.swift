import Foundation
import AbadaDI

// MARK: - WishAssembly
final class WishAssembly: Assembly {
    func assemble() {
        Container.shared.register(service: WishTableManager.self) { _ in
            WishTableManager()
        }

        Container.shared.register(service: GroupServisRouter.self) { _ in
            GroupServisRouter()
        }

        Container.shared.register(service: WishPresenter.self) { resolve in
            let tableManager: WishTableManager = resolve.resolve()
            let router: GroupServisRouter = resolve.resolve()
            return WishPresenter(tableManager: tableManager, router: router)
        }

        Container.shared.register(service: WishViewController.self) { resolve in
            let presenter: WishPresenter = resolve.resolve()
            return WishViewController(presenter: presenter)
        }

        @Dependency var presenter: WishPresenter
        @Dependency var view: WishViewController
        @Dependency var tableManager: WishTableManager
        @Dependency var router: GroupServisRouter

        presenter.view = view
        tableManager.setup(tableView: view.tableView)
        router.view = view
    }
}
