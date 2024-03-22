import Foundation

// MARK: - CompanyPresenter
final class CompanyPresenter {
    weak var view: CompanyInput?
}

// MARK: - CompanyPresenterProtocol
extension CompanyPresenter: CompanyPresenterProtocol {
    func viewDidLoad() {
        view?.viewTitle("О нас")
    }
}
