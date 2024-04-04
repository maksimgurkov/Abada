import UIKit
import AbadaUI

// MARK: - DetailGroupViewController
final class DetailGroupViewController: UIViewController {

    // MARK: - Private properties
    private let presenter: DetailGroupPresenterProtocol

    private lazy var closedButton: CloseButtonUI = {
        let button = CloseButtonUI()
        button.addTarget(self, action: #selector(tupCloseButton), for: .touchUpInside)
        return button
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()

    private let imageWork: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 8
        image.layer.masksToBounds = true
        return image
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()

    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = #colorLiteral(red: 1, green: 0.8666666667, blue: 0.1764705882, alpha: 1)
        return label
    }()

    private lazy var applicationButton: BigButtonUI = {
        let button = BigButtonUI(title: "Заказать услугу")
        return button
    }()

    private lazy var phoneButton: BigButtonUI = {
        let button = BigButtonUI(title: "Позвонить")
        return button
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
        presenter.getTitle(titleLabel)
        presenter.getImage(imageWork)
        presenter.getDescriptionLabel(descriptionLabel)
        presenter.getPriceLabel(priceLabel)
    }
}

// MARK: - DetailGroupInput
extension DetailGroupViewController: DetailGroupInput { }

// MARK: - SetupView
private extension DetailGroupViewController {
    func setupView() {
        view.backgroundColor = .systemBackground
        addSubView()
        setConstraints()
    }
}

// MARK: - Setting
private extension DetailGroupViewController {
    func addSubView() {
        view.addSubviews(
            [
                closedButton,
                titleLabel,
                imageWork,
                descriptionLabel,
                priceLabel,
                applicationButton,
                phoneButton
            ]
        )
    }
}

// MARK: - Layout
private extension DetailGroupViewController {
    func setConstraints() {
        NSLayoutConstraint.activate([
            closedButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            closedButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),

            titleLabel.centerYAnchor.constraint(equalTo: closedButton.centerYAnchor),
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),

            imageWork.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            imageWork.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            imageWork.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            imageWork.heightAnchor.constraint(equalToConstant: 200),

            descriptionLabel.topAnchor.constraint(equalTo: imageWork.bottomAnchor, constant: 20),
            descriptionLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            descriptionLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),

            priceLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            priceLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            priceLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),

            applicationButton.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 20),
            applicationButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            applicationButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),

            phoneButton.topAnchor.constraint(equalTo: applicationButton.bottomAnchor, constant: 20),
            phoneButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            phoneButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        ])
    }
}

// MARK: - Action
private extension DetailGroupViewController {
    @objc
    func tupCloseButton() {
        dismiss(animated: true)
    }
}
