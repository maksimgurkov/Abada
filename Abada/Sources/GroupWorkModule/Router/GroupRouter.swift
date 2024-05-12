import UIKit
import AbadaDI

protocol GroupRouterProtocol {
    func goToGroupDetail(viewModel: GroupViewModel)
}

final class GroupRouter: GroupRouterProtocol {
    weak var view: UIViewController?

    func goToGroupDetail(viewModel: GroupViewModel) {
        GroupDetailAssembly(viewModel: viewModel).assemble()
        @Dependency var detailGroupModule: DetailGroupViewController
        view?.present(detailGroupModule, animated: true)
    }
}
