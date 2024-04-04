import UIKit

// MARK: - GroupWorkPresenter
final class GroupWorkPresenter {
    weak var view: GroupWorkInput?

    // MARK: - Private properties
    private let viewModels: WorkGroupViewModel
    private let tableManager: GroupTableManagerProtocol
    private let router: GroupRouterProtocol

    // MARK: - Init
    init(tableManager: GroupTableManagerProtocol, viewModels: WorkGroupViewModel, router: GroupRouterProtocol) {
        self.tableManager = tableManager
        self.viewModels = viewModels
        self.router = router
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
            let viewModel = GroupViewModel(
                image: $0.image,
                title: $0.title,
                description: $0.description,
                price: $0.price
            ) { model in
                self.router.goTuGroupDetail(viewModel: model)
            }
            viewModels.append(viewModel)
        }

        DispatchQueue.main.async {
            self.tableManager.update(viewModel: viewModels)
        }
    }
}
