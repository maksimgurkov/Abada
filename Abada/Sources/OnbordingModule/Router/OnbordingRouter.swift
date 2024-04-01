import UIKit
import AbadaDI

// MARK: - OnbordingRouterProtocol
protocol OnbordingRouterProtocol {
    func goToTabBar()
}

// MARK: - OnbordingRouter
final class OnbordingRouter: OnbordingRouterProtocol {

    weak var view: UIViewController?

    func goToTabBar() {
        @Dependency var tabBarModule: TabBarViewController
        tabBarModule.modalPresentationStyle = .fullScreen
        view?.present(tabBarModule, animated: true)
    }
}
