import UIKit

// MARK: - NewsViewController
final class NewsViewController: UIViewController {

    // MARK: - Private properties
    private let presenter: NewsPresenterProtocol

    lazy var tableView: UITableView = {
        return UITableView(frame: .zero, style: .plain)
    }()

    // MARK: - Initialisers
    init(presenter: NewsPresenterProtocol) {
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

// MARK: - NewsInput
extension NewsViewController: NewsInput {
    func viewTitle(_ title: String) {
        self.title = title
    }
}

// MARK: - SetupView
private extension NewsViewController {
    func setupView() {
        view.backgroundColor = .systemBackground
        addSubView()
        setConstraints()
    }
}

// MARK: - Setting
private extension NewsViewController {
    func addSubView() {
        view.addSubviews([tableView])
    }
}

// MARK: - Layout
private extension NewsViewController {
    func setConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
