import UIKit
import AbadaDI

// MARK: - WorkRouterProtocol
protocol WorkRouterProtocol {
    func goTuGroupWork(viewModel: WorkGroupViewModel)
}

// MARK: - WorkRouter
final class WorkRouter: WorkRouterProtocol {
    weak var view: UIViewController?

    func goTuGroupWork(viewModel: WorkGroupViewModel) {
        GroupWorkAssembly(viewModels: viewModel).assemble()
        @Dependency var groupModule: GroupWorkViewController
        view?.navigationController?.pushViewController(groupModule, animated: true)
    }
}
