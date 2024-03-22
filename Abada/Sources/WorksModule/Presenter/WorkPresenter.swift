import Foundation

// MARK: - WorkPresenter
final class WorkPresenter {
    weak var view: WorkInput?
}

// MARK: - WorkPresenter
extension WorkPresenter: WorkPresenterProtocol {
    func viewDidLoad() {
        view?.titleView("Услуги")
    }
}
