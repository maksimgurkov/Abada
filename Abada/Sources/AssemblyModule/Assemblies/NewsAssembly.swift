import Foundation
import AbadaDI

// MARK: - NewsAssembly
final class NewsAssembly: Assembly {
    func assemble() {
        Container.shared.register(service: NewsPresenter.self) { _ in
            NewsPresenter()
        }

        Container.shared.register(service: NewsViewController.self) { resolve in
            let presenter: NewsPresenter = resolve.resolve()
            return NewsViewController(presenter: presenter)
        }

        @Dependency var presenter: NewsPresenter
        @Dependency var view: NewsViewController

        presenter.view = view
    }

}
