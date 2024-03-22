import UIKit

// MARK: - CompanyViewController
final class CompanyViewController: UIViewController {

    // MARK: - Private properties
    private let presenter: CompanyPresenterProtocol

    // MARK: - Initialisers
    init(presenter: CompanyPresenterProtocol) {
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

// MARK: - CompanyInput
extension CompanyViewController: CompanyInput {
    func viewTitle(_ title: String) {
        self.title = title
    }
}

// MARK: - SetupView
extension CompanyViewController {
    func setupView() {
        view.backgroundColor = .systemBackground
        addSubView()
        setConstraints()
    }
}

// MARK: - Setting
extension CompanyViewController {
    func addSubView() {
        // TODO: -
    }
}

// MARK: - Layout
extension CompanyViewController {
    func setConstraints() {
        // TODO: -
    }
}
