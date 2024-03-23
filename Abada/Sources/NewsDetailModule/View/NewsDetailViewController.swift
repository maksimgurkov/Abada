import UIKit

// MARK: - NewsDetailViewController
final class NewsDetailViewController: UIViewController {

    // MARK: - Private properties
    private let presenter: NewsDetailPresenterProtocol

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
extension NewsDetailViewController: NewsDetailInput { }

// MARK: - SetupView
private extension NewsDetailViewController {
    func setupView() {
        view.backgroundColor = .systemBackground
        addSubView()
        setConstraints()
    }
}

// MARK: - Setting
private extension NewsDetailViewController {
    func addSubView() {

    }
}

// MARK: - Layout
private extension NewsDetailViewController {
    func setConstraints() {
        NSLayoutConstraint.activate([

        ])
    }
}
