import UIKit
import AbadaUI

// MARK: - GroupServisViewController
final class GroupServisViewController: UIViewController {

    // MARK: - Private properties
    private let presenter: GroupServisPresenterProtocol

    private lazy var closeButton: CloseButtonUI = {
        let button = CloseButtonUI()
        button.addTarget(self, action: #selector(tupCloseButton), for: .touchUpInside)
        return button
    }()

    private let headerLabel = HeaderLabelUI(text: "")

    lazy var tableView: UITableView = {
        return UITableView(frame: .zero, style: .plain)
    }()

    // MARK: - Init
    init(presenter: GroupServisPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public functions
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter.viewDidLoad()
        presenter.getTitle(headerLabel)
    }
}

extension GroupServisViewController: GroupServisInput { }

// MARK: - SetupView
private extension GroupServisViewController {
    func setupView() {
        view.backgroundColor = AbadaColors.Color(resource: .abadaBackground)
        addSubView()
        setConstraints()
    }
}

// MARK: - Setting
private extension GroupServisViewController {
    func addSubView() {
        view.addSubviews([headerLabel, closeButton, tableView])
    }
}

// MARK: - Layout
private extension GroupServisViewController {
    func setConstraints() {
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            headerLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            headerLabel.rightAnchor.constraint(equalTo: closeButton.leftAnchor, constant: -20),

            closeButton.centerYAnchor.constraint(equalTo: headerLabel.centerYAnchor),
            closeButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),

            tableView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 20),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

// MARK: - Action
private extension GroupServisViewController {
    @objc
    func tupCloseButton() {
        dismiss(animated: true)
    }
}