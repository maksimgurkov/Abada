import Foundation
import AbadaDI

// MARK: - WishAssembly
final class WishAssembly: Assembly {
    func assemble() {
        Container.shared.register(service: WishPresenter.self) { _ in
            WishPresenter()
        }

        Container.shared.register(service: WishViewController.self) { resolve in
            let presenter: WishPresenter = resolve.resolve()
            return WishViewController(presenter: presenter)
        }

        @Dependency var presenter: WishPresenter
        @Dependency var view: WishViewController

        presenter.view = view
    }
}
