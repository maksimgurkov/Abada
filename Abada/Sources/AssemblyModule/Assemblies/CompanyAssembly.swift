import Foundation
import AbadaDI

final class CompanyAssembly: Assembly {
    func assemble() {
        Container.shared.register(service: CompanyPresenter.self) { _ in
            CompanyPresenter()
        }

        Container.shared.register(service: CompanyViewController.self) { resolve in
            let presenter: CompanyPresenter = resolve.resolve()
            return CompanyViewController(presenter: presenter)
        }

        @Dependency var presenter: CompanyPresenter
        @Dependency var view: CompanyViewController

        presenter.view = view
    }
}
