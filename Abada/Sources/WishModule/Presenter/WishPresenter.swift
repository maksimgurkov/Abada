import Foundation

// MARK: - WishPresenter
final class WishPresenter {
    weak var view: WishInput?
}

// MARK: - WishPresenterProtocol
extension WishPresenter: WishPresenterProtocol {
    func viewDidLoad() {
        view?.viewTitle("Цели")
    }
}
