import Foundation
import AbadaDI

// MARK: - WorkAssembly
final class WorkAssembly: Assembly {
    func assemble() {
        Container.shared.register(service: WorkPresenter.self) { _ in
            WorkPresenter()
        }

        Container.shared.register(service: WorkViewController.self) { resolve in
            let presenter: WorkPresenter = resolve.resolve()
            return WorkViewController(presenter: presenter)
        }

        @Dependency var presenter: WorkPresenter
        @Dependency var view: WorkViewController

        presenter.view = view
    }
}
