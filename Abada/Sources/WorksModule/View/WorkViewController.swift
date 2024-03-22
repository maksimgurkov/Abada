import UIKit

// MARK: - WorkViewController
final class WorkViewController: UIViewController {

    // MARK: - Private properties
    private let presenter: WorkPresenterProtocol

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
    }
}

// MARK: - Setting
private extension WorkViewController {
    func addSubView() {
        // TODO: - добавление SubView
    }
}
