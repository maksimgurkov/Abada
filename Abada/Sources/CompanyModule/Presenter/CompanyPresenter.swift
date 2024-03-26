import Foundation

// MARK: - CompanyPresenter
final class CompanyPresenter {
    weak var view: CompanyInput?

    // MARK: - Private properties
    private let tableManager: CompanyTableManagerProtocol
    private let viewModels = CompanyData.shared.company

    init(tableView: CompanyTableManagerProtocol) {
        self.tableManager = tableView
    }
}

// MARK: - CompanyPresenterProtocol
extension CompanyPresenter: CompanyPresenterProtocol {
    func viewDidLoad() {
        view?.viewTitle("О нас")
        createViewModel(viewModels: viewModels)
    }
}

// MARK: - Setting
private extension CompanyPresenter {
    func createViewModel(viewModels: [CompanyModel]) {
        var models = [CompanyViewModel]()

        viewModels.forEach {
            let viewModel = CompanyViewModel(
                title: $0.title,
                subtitle: $0.subTitle,
                description: $0.description
            )
            models.append(viewModel)
        }
        DispatchQueue.main.async {
            self.tableManager.update(viewModels: models)
        }
    }
}
