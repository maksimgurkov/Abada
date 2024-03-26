import UIKit
import AbadaDI

// MARK: - ApplicationRouterProtocol
protocol ApplicationRouterProtocol {
    func routerToApplication()
}

// MARK: - ApplicationRouterProtocol
final class ApplicationRouter: ApplicationRouterProtocol {
    weak var view: UIViewController?

    func routerToApplication() {
        @Dependency var applicationModule: ApplicationViewController
        view?.present(applicationModule, animated: true)
    }
}
