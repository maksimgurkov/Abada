import UIKit

// MARK: - NewsViewController
final class NewsViewController: UIViewController {

    // MARK: - Private properties
    private let presenter: NewsPresenterProtocol

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
        // TODO: - Добавление subView
    }
}

// MARK: - Layout
private extension NewsViewController {
    func setConstraints() {
        // TODO: - Расположение subView
    }
}
