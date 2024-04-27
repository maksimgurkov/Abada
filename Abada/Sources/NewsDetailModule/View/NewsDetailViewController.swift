import UIKit
import AbadaUI

// MARK: - NewsDetailViewController
final class NewsDetailViewController: UIViewController {

    // MARK: - Private properties
    private let presenter: NewsDetailPresenterProtocol

    private let headerLabel = HeaderLabelUI(text: "")

    private lazy var closeButton: CloseButtonUI = {
        let button = CloseButtonUI()
        button.addTarget(self, action: #selector(tupCloseButton), for: .touchUpInside)
        return button
    }()

    lazy var tableView: UITableView = {
        return UITableView(frame: .zero, style: .plain)
    }()

    // MARK: - Initialisers
    init(presenter: NewsDetailPresenterProtocol) {
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

// MARK: - NewsDetailInput
extension NewsDetailViewController: NewsDetailInput {
    func updateView(viewModel: DetailViewModel) {
        self.headerLabel.text = viewModel.title
    }
}

// MARK: - SetupView
private extension NewsDetailViewController {
    func setupView() {
        view.backgroundColor = AbadaColors.Color(resource: .abadaBackground)
        addSubView()
        setConstraints()
    }
}

// MARK: - Setting
private extension NewsDetailViewController {
    func addSubView() {
        view.addSubviews([closeButton, headerLabel, tableView])
    }
}

// MARK: - Layout
private extension NewsDetailViewController {
    func setConstraints() {
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            closeButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),

            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            headerLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -80),

            tableView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 8),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

private extension NewsDetailViewController {
    @objc
    func tupCloseButton() {
        dismiss(animated: true)
    }
}
