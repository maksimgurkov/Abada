import UIKit

// MARK: - WishViewController
final class WishViewController: UIViewController {

    // MARK: - Private properties
    private let presenter: WishPresenterProtocol

    // MARK: - Initialiser
    init(presenter: WishPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Override functions
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        setupView()
    }

}

// MARK: - WishInput
extension WishViewController: WishInput {
    func viewTitle(_ title: String) {
        self.title = title
    }
}

// MARK: - Setting
extension WishViewController {
    func setupView() {
        view.backgroundColor = AbadaColors.Color(resource: .abadaBackground)
        addSubView()
        setConstraints()
    }
}

// MARK: - Setting
extension WishViewController {
    func addSubView() {
        view.addSubviews([

        ])
    }
}

// MARK: - Layout
extension WishViewController {
    func setConstraints() {
        NSLayoutConstraint.activate([

        ])
    }
}
