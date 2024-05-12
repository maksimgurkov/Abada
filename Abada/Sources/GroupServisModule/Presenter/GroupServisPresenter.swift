import UIKit

// MARK: - GroupServisPresenter
final class GroupServisPresenter {
    weak var view: GroupServisInput?

    // MARK: - Private properties
    private let viewModels: WorkGroupViewModel
    private let tableManager: GroupServisTableManagerProtocol
    private let router: GroupServisRouterProtocol

    // MARK: - Init
    init(
        tableManager: GroupServisTableManagerProtocol,
        viewModels: WorkGroupViewModel,
        router: GroupServisRouterProtocol
    ) {
        self.tableManager = tableManager
        self.viewModels = viewModels
        self.router = router
    }
}

// MARK: - GroupWorkPresenterProtocol
extension GroupServisPresenter: GroupServisPresenterProtocol {
    func viewDidLoad() {
        createViewModel(model: viewModels)
    }
    func getTitle(_ label: UILabel) {
        label.text = viewModels.nameGroup
    }
}

private extension GroupServisPresenter {
    func createViewModel(model: WorkGroupViewModel) {
        var viewModels = [DetailServisViewModel]()

        model.groups.forEach {
            let viewModel = DetailServisViewModel(
                image: $0.image,
                title: $0.title,
                detailArticle: $0.description,
                price: $0.price
            ) { model in
                self.router.goToGroupDetail(viewModel: model)
            }
            viewModels.append(viewModel)
        }

        DispatchQueue.main.async {
            self.tableManager.update(viewModel: viewModels)
        }
    }
}
