import Foundation

// MARK: - NewsDetailPresenter
final class NewsDetailPresenter {

    weak var view: NewsDetailInput?

    // MARK: - Private properties
    private let viewModel: DetailViewModel
    private let tableManager: NewsDetailTableManagerProtocol

    // MARK: - Initialisers
    init(viewModel: DetailViewModel, tableManager: NewsDetailTableManagerProtocol) {
        self.viewModel = viewModel
        self.tableManager = tableManager
    }
}

// MARK: - NewsDetailPresenterProtocol
extension NewsDetailPresenter: NewsDetailPresenterProtocol {
    func viewDidLoad() {
        view?.updateView(viewModel: viewModel)
        createViewModel(viewModel: viewModel)
    }
}

// MARK: - Private extension
private extension NewsDetailPresenter {
    func createViewModel(viewModel: DetailViewModel) {
        var viewModels = [NewsTypeCell]()

        let imageModel: NewsTypeCell = .newsImage(.init(image: viewModel.image))
        viewModels.append(imageModel)

        let descriptionModel: NewsTypeCell = .newsDescription(.init(description: viewModel.description))
        viewModels.append(descriptionModel)

        let newsButtonViewModel: NewsTypeCell = .newsButton(.init(title: "Оставить заявку"))
        viewModels.append(newsButtonViewModel)

        DispatchQueue.main.async {
            self.tableManager.update(viewModels: viewModels)
        }
    }
}
