import Foundation

// MARK: - GroupWorkPresenter
final class GroupWorkPresenter {
    weak var view: GroupWorkInput?

    // MARK: - Private properties
    private let viewModels: WorkGroupViewModel
    private let tableManager: GroupTableManagerProtocol

    // MARK: - Init
    init(tableManager: GroupTableManagerProtocol, viewModels: WorkGroupViewModel) {
        self.tableManager = tableManager
        self.viewModels = viewModels
    }
}

// MARK: - GroupWorkPresenterProtocol
extension GroupWorkPresenter: GroupWorkPresenterProtocol {
    func viewDidLoad() {
        view?.viewTitle(viewModels.nameGroup)
    }
}
