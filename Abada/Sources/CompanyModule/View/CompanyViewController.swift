import UIKit

// MARK: - CompanyViewController
final class CompanyViewController: UIViewController {

    // MARK: - Private properties
    private let presenter: CompanyPresenterProtocol

    lazy var tableView: UITableView = {
        return UITableView(frame: .zero, style: .plain)
    }()

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
        view.addSubviews([
            tableView
        ])
    }
}

// MARK: - Layout
extension CompanyViewController {
    func setConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])
    }
}
