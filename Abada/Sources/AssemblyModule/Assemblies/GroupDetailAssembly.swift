import Foundation
import AbadaDI

final class GroupDetailAssembly: Assembly {

    var viewModel: GroupViewModel

    init(viewModel: GroupViewModel) {
        self.viewModel = viewModel
    }

    func assemble() {
        Container.shared.register(service: DetailGroupPresenter.self) { _ in
            DetailGroupPresenter(viewModel: self.viewModel)
        }

        Container.shared.register(service: DetailGroupViewController.self) { resolve in
            let presenter: DetailGroupPresenter = resolve.resolve()
            return DetailGroupViewController(presenter: presenter)
        }

        @Dependency var presenter: DetailGroupPresenter
        @Dependency var view: DetailGroupViewController

        presenter.view = view
    }
}
