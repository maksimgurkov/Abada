import Foundation

// MARK: - DiscountPresenter
final class DiscountPresenter {
    weak var view: DiscountInput?

    private let tableView: DiscountTableManagerProtocol

    init(tableView: DiscountTableManagerProtocol) {
        self.tableView = tableView
    }
}

// MARK: - DiscountPresenterProtocol
extension DiscountPresenter: DiscountPresenterProtocol {
    func viewDidLoad() {
        DispatchQueue.main.async {
            self.tableView.update(viewModels: [1, 2, 3])
        }
    }
}
