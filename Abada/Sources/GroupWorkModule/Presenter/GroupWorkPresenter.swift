import Foundation

// MARK: - GroupWorkPresenter
final class GroupWorkPresenter {
    weak var view: GroupWorkInput?

    // MARK: - Private properties
    private let tableManager: GroupTableManagerProtocol

    // MARK: - Init
    init(tableManager: GroupTableManagerProtocol) {
        self.tableManager = tableManager
    }
}

// MARK: - GroupWorkPresenterProtocol
extension GroupWorkPresenter: GroupWorkPresenterProtocol {
    func viewDidLoad() {
        DispatchQueue.main.async {
            self.tableManager.update(viewModel: [1, 1, 1])
        }
    }
}
