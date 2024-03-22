import Foundation

// MARK: - NewsPresenter
final class NewsPresenter {
    weak var view: NewsInput?
}

// MARK: - NewsPresenterProtocol
extension NewsPresenter: NewsPresenterProtocol {
    func viewDidLoad() {
        view?.viewTitle("Новости")
    }

}
