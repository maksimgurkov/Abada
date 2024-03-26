import UIKit
import AbadaDI

// MARK: - DiscountRouterProtocol
protocol DiscountRouterProtocol {
    func routerToPersonDiscount()
}

// MARK: - DiscountRouter
final class DiscountRouter: DiscountRouterProtocol {

    weak var view: UIViewController?

    func routerToPersonDiscount() {
        @Dependency var personDiscountModule: PersonDiscountViewController
        view?.present(personDiscountModule, animated: true)
    }
}
