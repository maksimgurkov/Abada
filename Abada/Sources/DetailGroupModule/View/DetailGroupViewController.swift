import UIKit

// MARK: - DetailGroupViewController
final class DetailGroupViewController: UIViewController {

    // MARK: - Private properties
    private let presenter: DetailGroupPresenterProtocol

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
}

// MARK: - DetailGroupInput
extension DetailGroupViewController: DetailGroupInput { }

// MARK: - SetupView
private extension DetailGroupViewController {
    func setupView() {
        addSubView()
        setConstraints()
    }
}

// MARK: - Setting
private extension DetailGroupViewController {
    func addSubView() {

    }
}

// MARK: - Layout
private extension DetailGroupViewController {
    func setConstraints() {
        NSLayoutConstraint.activate([])
    }
}
