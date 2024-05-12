import UIKit
import AbadaDI

// MARK: - GroupServisRouterProtocol
protocol GroupServisRouterProtocol {
    func goToGroupDetail(viewModel: DetailServisViewModel)
}

// MARK: - GroupServisRouter
final class GroupServisRouter: GroupServisRouterProtocol {
    weak var view: UIViewController?

    func goToGroupDetail(viewModel: DetailServisViewModel) {
        DetailServisAssembly(viewModel: viewModel).assemble()
        @Dependency var detailGroupModule: DetailServiceViewController
        view?.present(detailGroupModule, animated: true)
    }
}
