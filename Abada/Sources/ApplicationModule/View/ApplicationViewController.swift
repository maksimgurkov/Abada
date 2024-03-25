import UIKit
import AbadaUI

// MARK: - ApplicationViewController
final class ApplicationViewController: UIViewController {

    // MARK: - Private properties
    private let presenter: ApplicationPresenterProtocol

    private lazy var closeButton: CloseButtonUI = {
        let button = CloseButtonUI()
        button.addTarget(self, action: #selector(tupCloseButton), for: .touchUpInside)
        return button
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()

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
        titleLabel.text = "Подать заявку"
        descriptionLabel.text = "Менеджеры компании с радостью свяжутся с вами и ответят на ваши вопросы и произведут расчет стоимости услуг и подготовят индивидуальное коммерческое предложение."
        addSubView()
        setConstraints()
    }
}

// MARK: - Setting
private extension ApplicationViewController {
    func addSubView() {
        view.addSubviews([closeButton, titleLabel, descriptionLabel])
    }
}

// MARK: - Layout
private extension ApplicationViewController {
    func setConstraints() {
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            closeButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),

            titleLabel.centerYAnchor.constraint(equalTo: closeButton.centerYAnchor),
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),

            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            descriptionLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            descriptionLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        ])
    }
}

// MARK: - Actions
private extension ApplicationViewController {
    @objc
    func tupCloseButton() {
        dismiss(animated: true)
    }
}
