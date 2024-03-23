import Foundation
import AbadaDI

// MARK: - DiscountAssembly
final class DiscountAssembly: Assembly {
    func assemble() {
        Container.shared.register(service: DiscountTableManager.self) { _ in
            DiscountTableManager()
        }
        Container.shared.register(service: DiscountPresenter.self) { resolve in
            let tableManager: DiscountTableManager = resolve.resolve()
            return DiscountPresenter(tableView: tableManager)
        }

        Container.shared.register(service: DiscountViewController.self) { resolve in
            let presenter: DiscountPresenter = resolve.resolve()
            return DiscountViewController(presenter: presenter)
        }

        @Dependency var presenter: DiscountPresenter
        @Dependency var view: DiscountViewController
        @Dependency var tableManager: DiscountTableManager

        presenter.view = view
        tableManager.setup(tableView: view.tableView)
    }
}
