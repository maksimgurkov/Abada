import UIKit
import AbadaDI

// MARK: - NewsDetailRouterProtocol
protocol NewsDetailRouterProtocol {
    func routerToNewsDetail(viewModel: DetailViewModel)
}

// MARK: - NewsDetailRouterProtocol
final class NewsDetailRouter: NewsDetailRouterProtocol {
    weak var view: UIViewController?

    func routerToNewsDetail(viewModel: DetailViewModel) {
        NewsDetailAssembly.init(viewModel: viewModel).assemble()
        @Dependency var newsDetailModule: NewsDetailViewController
        view?.present(newsDetailModule, animated: true)
    }
}
