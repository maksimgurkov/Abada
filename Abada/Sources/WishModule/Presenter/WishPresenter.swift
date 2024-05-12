import Foundation
import RealmSwift

// MARK: - WishPresenter
final class WishPresenter {

    weak var view: WishInput?

    private let tableManager: WishTableManagerProtocol
    private var viewModel: Results<WishViewModelRealm>?
    private let router: GroupServisRouterProtocol

    init(tableManager: WishTableManagerProtocol, viewModel: Results<WishViewModelRealm>? = nil, router: GroupServisRouterProtocol) {
        self.tableManager = tableManager
        self.viewModel = viewModel
        self.router = router
    }
}

// MARK: - WishPresenterProtocol
extension WishPresenter: WishPresenterProtocol {
    func viewDidLoad() {
        view?.viewTitle("Цели")
        viewModel = StorageManager.shared.realm.objects(WishViewModelRealm.self)
        createViewModel()
    }
}

extension WishPresenter {
    func createViewModel() {
        var viewModels = [DetailServisViewModel]()

        viewModel?.forEach {
            let model = DetailServisViewModel(
                image: $0.image,
                title: $0.title,
                detailArticle: $0.detailArticle,
                price: $0.price) { model in
                self.router.goToGroupDetail(viewModel: model)
            }
            viewModels.append(model)
        }

        DispatchQueue.main.async {
            self.tableManager.update(viewModels: viewModels)
        }
    }
}
