import UIKit
import AbadaUI

// MARK: - GroupWorkViewController
final class GroupWorkViewController: UIViewController {

    // MARK: - Private properties
    private let presenter: GroupWorkPresenterProtocol

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
    init(presenter: GroupWorkPresenterProtocol) {
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

extension GroupWorkViewController: GroupWorkInput { }

// MARK: - SetupView
private extension GroupWorkViewController {
    func setupView() {
        view.backgroundColor = AbadaColors.Color(resource: .abadaBackground)
        addSubView()
        setConstraints()
    }
}

// MARK: - Setting
private extension GroupWorkViewController {
    func addSubView() {
        view.addSubviews([headerLabel, closeButton, tableView])
    }
}

// MARK: - Layout
private extension GroupWorkViewController {
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
private extension GroupWorkViewController {
    @objc
    func tupCloseButton() {
        dismiss(animated: true)
    }
}
