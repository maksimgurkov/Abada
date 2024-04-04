import Foundation
import AbadaDI

// MARK: - GroupWorkAssembly
final class GroupWorkAssembly: Assembly {

    private let viewModels: WorkGroupViewModel

    init(viewModels: WorkGroupViewModel) {
        self.viewModels = viewModels
    }

    func assemble() {
        Container.shared.register(service: GroupTableManager.self) { _ in
            GroupTableManager()
        }

        Container.shared.register(service: GroupWorkPresenter.self) { resolve in
            let tableManager: GroupTableManager = resolve.resolve()
            return GroupWorkPresenter(tableManager: tableManager, viewModels: self.viewModels)
        }

        Container.shared.register(service: GroupWorkViewController.self) { resolve in
            let presenter: GroupWorkPresenter = resolve.resolve()
            return GroupWorkViewController(presenter: presenter)
        }

        @Dependency var tableManager: GroupTableManager
        @Dependency var presenter: GroupWorkPresenter
        @Dependency var view: GroupWorkViewController

        presenter.view = view
        tableManager.setup(tableView: view.tableView)
    }
}
