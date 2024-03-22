import UIKit

// MARK: - DiscountViewController
final class DiscountViewController: UIViewController {

    // MARK: - Private properties
    private let presenter: DiscountPresenterProtocol

    private let backView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 2
        return view
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Твоя персональная скидка"
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textAlignment = .center
        return label
    }()

    private let nameDiscountLabel: UILabel = {
        let label = UILabel()
        label.text = "На установку кондиционера"
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()

    private let discountLabel: UILabel = {
        let label = UILabel()
        label.text = "5000₽"
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textColor = #colorLiteral(red: 0.9259498715, green: 0.1481695175, blue: 0.1445552111, alpha: 1)
        label.textAlignment = .right
        return label
    }()

    private let codeLabel: UILabel = {
        let label = UILabel()
        label.text = "кондей24"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Срок действия до 15.04.2024"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = #colorLiteral(red: 0.8073016405, green: 0.8142485023, blue: 0.8175470233, alpha: 1)
        return label
    }()

    // MARK: - Initialisers
    init(presenter: DiscountPresenterProtocol) {
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

// MARK: - DiscountInput
extension DiscountViewController: DiscountInput {
    func viewTitle(_ title: String) {
        self.title = title
    }
}

// MARK: - SetupView
private extension DiscountViewController {
    func setupView() {
        view.backgroundColor = .systemBackground
        addSubView()
        setConstraints()
    }

}

// MARK: - Setting
private extension DiscountViewController {
    func addSubView() {
        view.addSubviews([
            backView,
            titleLabel
        ])
        backView.addSubviews([
            nameDiscountLabel,
            discountLabel,
            descriptionLabel,
            codeLabel
        ])
    }
}

// MARK: - Layout
private extension DiscountViewController {
    func setConstraints() {
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 220),
            backView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -220),
            backView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            backView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),

            titleLabel.bottomAnchor.constraint(equalTo: backView.topAnchor, constant: -20),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            nameDiscountLabel.topAnchor.constraint(equalTo: backView.topAnchor, constant: 20),
            nameDiscountLabel.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 20),
            nameDiscountLabel.widthAnchor.constraint(equalToConstant: 190),

            discountLabel.centerYAnchor.constraint(equalTo: nameDiscountLabel.centerYAnchor),
            discountLabel.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -20),

            descriptionLabel.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -20),
            descriptionLabel.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 20),
            descriptionLabel.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -20),

            codeLabel.centerXAnchor.constraint(equalTo: backView.centerXAnchor),
            codeLabel.centerYAnchor.constraint(equalTo: backView.centerYAnchor)
        ])
    }
}
