import UIKit
import AbadaDI

// MARK: - NewsDetailRouterProtocol
protocol NewsDetailRouterProtocol {
    func routerToNewsDetail()
}

// MARK: - NewsDetailRouterProtocol
final class NewsDetailRouter: NewsDetailRouterProtocol {
    weak var view: UIViewController?

    func routerToNewsDetail() {
        @Dependency var newsDetailModule: NewsDetailViewController
        view?.present(newsDetailModule, animated: true)
    }
}
