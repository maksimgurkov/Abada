import Foundation
import AbadaDI

// MARK: - DiscountAssembly
final class DiscountAssembly: Assembly {
    func assemble() {
        Container.shared.register(service: DiscountPresenter.self) { _ in
            DiscountPresenter()
        }

        Container.shared.register(service: DiscountViewController.self) { resolve in
            let presenter: DiscountPresenter = resolve.resolve()
            return DiscountViewController(presenter: presenter)
        }

        @Dependency var presenter: DiscountPresenter
        @Dependency var view: DiscountViewController

        presenter.view = view
    }
}
