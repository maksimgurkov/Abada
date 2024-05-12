import UIKit
import AbadaUI

// MARK: - DetailGroupViewController
final class DetailGroupViewController: UIViewController {

    // MARK: - Private properties
    private let presenter: DetailGroupPresenterProtocol

    lazy var closingLeverView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(resource: .abadaGray)
        view.layer.cornerRadius = 2
        return view
    }()

    lazy var tableView: UITableView = {
        return UITableView(frame: .zero, style: .plain)
    }()

    // MARK: - Init
    init(presenter: DetailGroupPresenterProtocol) {
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
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewDidLoad()
    }
}

// MARK: - DetailGroupInput
extension DetailGroupViewController: DetailGroupInput { }

// MARK: - SetupView
private extension DetailGroupViewController {
    func setupView() {
        view.backgroundColor = AbadaColors.Color(resource: .abadaBackground)
        addSubView()
        setConstraints()
    }
}

// MARK: - Setting
private extension DetailGroupViewController {
    func addSubView() {
        view.addSubviews(
            [
                closingLeverView,
                tableView
            ]
        )
    }
}

// MARK: - Layout
private extension DetailGroupViewController {
    func setConstraints() {
        NSLayoutConstraint.activate([
            closingLeverView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            closingLeverView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            closingLeverView.heightAnchor.constraint(equalToConstant: 4),
            closingLeverView.widthAnchor.constraint(equalToConstant: 80),

            tableView.topAnchor.constraint(equalTo: closingLeverView.bottomAnchor, constant: 10),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
