import Foundation

// MARK: - WishPresenter
final class WishPresenter {
    weak var view: WishInput?

    private let tableManager: WishTableManagerProtocol

    init(tableManager: WishTableManagerProtocol) {
        self.tableManager = tableManager
    }
}

// MARK: - WishPresenterProtocol
extension WishPresenter: WishPresenterProtocol {
    func viewDidLoad() {
        view?.viewTitle("Цели")
    }
}