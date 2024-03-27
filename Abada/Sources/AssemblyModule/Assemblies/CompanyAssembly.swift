import Foundation
import AbadaDI

final class CompanyAssembly: Assembly {
    func assemble() {
        Container.shared.register(service: ApplicationRouter.self) { _ in
            ApplicationRouter()
        }
        Container.shared.register(service: CompanyTableManager.self) { _ in
            CompanyTableManager()
        }

        Container.shared.register(service: CompanyPresenter.self) { resolve in
            let tableManager: CompanyTableManager = resolve.resolve()
            let router: ApplicationRouter = resolve.resolve()
            return CompanyPresenter(tableView: tableManager, router: router)
        }

        Container.shared.register(service: CompanyViewController.self) { resolve in
            let presenter: CompanyPresenter = resolve.resolve()
            return CompanyViewController(presenter: presenter)
        }

        @Dependency var presenter: CompanyPresenter
        @Dependency var view: CompanyViewController
        @Dependency var tableManager: CompanyTableManager
        @Dependency var router: ApplicationRouter

        presenter.view = view
        router.view = view
        tableManager.setup(tableView: view.tableView)

    }
}
