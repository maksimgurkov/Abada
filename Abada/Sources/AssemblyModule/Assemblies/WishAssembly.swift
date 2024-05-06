import Foundation
import AbadaDI

// MARK: - WishAssembly
final class WishAssembly: Assembly {
    func assemble() {
        Container.shared.register(service: WishTableManager.self) { _ in
            WishTableManager()
        }

        Container.shared.register(service: WishPresenter.self) { resolve in
            let tableManager: WishTableManager = resolve.resolve()
            return WishPresenter(tableManager: tableManager)
        }

        Container.shared.register(service: WishViewController.self) { resolve in
            let presenter: WishPresenter = resolve.resolve()
            return WishViewController(presenter: presenter)
        }

        @Dependency var presenter: WishPresenter
        @Dependency var view: WishViewController
        @Dependency var tableManager: WishTableManager

        presenter.view = view
        tableManager.setup(tableView: view.tableView)
    }
}
