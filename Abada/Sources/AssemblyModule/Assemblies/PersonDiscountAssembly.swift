import Foundation
import AbadaDI

// MARK: - PersonDiscountAssembly
final class PersonDiscountAssembly: Assembly {
    func assemble() {
        Container.shared.register(service: PersonDiscountPresenter.self) { _ in
            PersonDiscountPresenter()
        }

        Container.shared.register(service: PersonDiscountViewController.self) { resolve in
            let presenter: PersonDiscountPresenter = resolve.resolve()
            return PersonDiscountViewController(presenter: presenter)
        }

        @Dependency var presenter: PersonDiscountPresenter
        @Dependency var view: PersonDiscountViewController

        presenter.view = view
    }
}
