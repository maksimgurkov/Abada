import UIKit

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
        createViewModel(model: viewModels)
    }
    func getTitle(_ label: UILabel) {
        label.text = viewModels.nameGroup
    }
}

private extension GroupWorkPresenter {
    func createViewModel(model: WorkGroupViewModel) {
        var viewModels = [GroupViewModel]()

        model.groups.forEach {
            let viewModel = GroupViewModel(image: $0.image, title: $0.title) {
                print("1")
            }
            viewModels.append(viewModel)
        }

        DispatchQueue.main.async {
            self.tableManager.update(viewModel: viewModels)
        }
    }
}
