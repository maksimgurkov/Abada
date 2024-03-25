import UIKit

// MARK: - ApplicationViewController
final class ApplicationViewController: UIViewController {

    // MARK: - Private properties
    private let presenter: ApplicationPresenterProtocol

    // MARK: - Initialisers
    init(presenter: ApplicationPresenterProtocol) {
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

// MARK: - ApplicationInput
extension ApplicationViewController: ApplicationInput { }

// MARK: - SetupView
private extension ApplicationViewController {
    func setupView() {
        view.backgroundColor = .systemBackground
        addSubView()
        setConstraints()
    }
}

// MARK: - Setting
private extension ApplicationViewController {
    func addSubView() {

    }
}

// MARK: - Layout
private extension ApplicationViewController {
    func setConstraints() {
        NSLayoutConstraint.activate([
        ])
    }
}
