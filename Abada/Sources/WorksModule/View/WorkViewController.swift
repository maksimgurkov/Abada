import UIKit
import AbadaUI

// MARK: - WorkViewController
final class WorkViewController: UIViewController {

    // MARK: - Private properties
    private let presenter: WorkPresenterProtocol

    private let searchTextField: CustomTextFieldUI = {
        return CustomTextFieldUI(placeholder: "Поиск")
    }()

    lazy var tableView: UITableView = {
        return UITableView(frame: .zero, style: .plain)
    }()

    // MARK: - Initialisers
    init(presenter: WorkPresenterProtocol) {
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

// MARK: - WorkInput
extension WorkViewController: WorkInput {
    func titleView(_ title: String) {
        self.title = title
    }
}

// MARK: - SetupView
private extension WorkViewController {
    func setupView() {
        view.backgroundColor = .systemBackground
        addSubView()
        setConstraints()
    }
}

// MARK: - Setting
private extension WorkViewController {
    func addSubView() {
        view.addSubviews([searchTextField, tableView])
    }
}

// MARK: - Layout
private extension WorkViewController {
    func setConstraints() {
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            searchTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),

            tableView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 20),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
