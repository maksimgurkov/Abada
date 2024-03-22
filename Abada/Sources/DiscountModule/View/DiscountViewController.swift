import UIKit

// MARK: - DiscountViewController
final class DiscountViewController: UIViewController {

    // MARK: - Private properties
    private let presenter: DiscountPresenterProtocol

    // MARK: - Initialisers
    init(presenter: DiscountPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Override functions
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter.viewDidLoad()
    }
}

// MARK: - DiscountInput
extension DiscountViewController: DiscountInput {
    func viewTitle(_ title: String) {
        self.title = title
    }
}

// MARK: - SetupView
private extension DiscountViewController {
    func setupView() {
        view.backgroundColor = .systemBackground
    }
}
