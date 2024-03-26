import Foundation
import AbadaDI

// MARK: - ApplicationAssembly
final class ApplicationAssembly: Assembly {
    func assemble() {
        Container.shared.register(service: ApplicationPresenter.self) { _ in
            ApplicationPresenter()
        }

        Container.shared.register(service: ApplicationViewController.self) { resolve in
            let presenter: ApplicationPresenter = resolve.resolve()
            return ApplicationViewController(presenter: presenter)
        }

        @Dependency var presenter: ApplicationPresenter
        @Dependency var view: ApplicationViewController

        presenter.view = view
    }
}
