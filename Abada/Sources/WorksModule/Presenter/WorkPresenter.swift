import Foundation

// MARK: - WorkPresenter
final class WorkPresenter {
    weak var view: WorkInput?

    // MARK: - Private properties
    private let tableManager: WorkTableManagerProtocol
    private let dataWork = WorkData.shared.works

    // MARK: - Init
    init(tableManager: WorkTableManagerProtocol) {
        self.tableManager = tableManager
    }
}

// MARK: - WorkPresenter
extension WorkPresenter: WorkPresenterProtocol {
    func viewDidLoad() {
        view?.titleView("Услуги")
        createViewModel(model: dataWork)
    }
}

// MARK: - Private extension
private extension WorkPresenter {
    func createViewModel(model: [WorkModel]) {
        var viewModels = [WorkViewModel]()
        var models = [DetailWorkViewModel]()

        model.forEach({
            $0.descriptionWork.forEach({
                let model = DetailWorkViewModel(
                    title: $0.title,
                    image: $0.image,
                    description: $0.description,
                    price: $0.price
                )
                models.append(model)
            })
            let viewModel = WorkViewModel(title: $0.title, descriptionWork: models)
            viewModels.append(viewModel)
            models = []
        })

        DispatchQueue.main.async {
            self.tableManager.update(viewModel: viewModels)
        }
    }
}
