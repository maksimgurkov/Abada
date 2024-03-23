import Foundation
import AbadaDI

// MARK: - NewsDetailAssembly
final class NewsDetailAssembly: Assembly {
    func assemble() {
        Container.shared.register(service: NewsDetailPresenter.self) { _ in
            NewsDetailPresenter()
        }

        Container.shared.register(service: NewsDetailViewController.self) { resolve in
            let presenter: NewsDetailPresenter = resolve.resolve()
            return NewsDetailViewController(presenter: presenter)
        }

        @Dependency var presenter: NewsDetailPresenter
        @Dependency var view: NewsDetailViewController

        presenter.view = view
    }
}
