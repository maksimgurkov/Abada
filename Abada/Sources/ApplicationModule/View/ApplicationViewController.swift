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

    private let nameTextField: CustomTextFieldUI = {
        return CustomTextFieldUI(placeholder: "Ваше имя")
    }()

    private let numberPhoneTextField: CustomTextFieldUI = {
        let textField = CustomTextFieldUI(placeholder: "Телефон")
        return textField
    }()

    private let emailTextField: CustomTextFieldUI = {
        let textField = CustomTextFieldUI(placeholder: "Email - по желанию")
        return textField
    }()

    private let applicationTextField: CustomTextFieldUI = {
        return CustomTextFieldUI(placeholder: "Интересующая услуга, например - Пол")
    }()

    private lazy var checkButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        button.tintColor = AbadaColors.Color(resource: .abadaPrimary)
        button.addTarget(self, action: #selector(tupCheckButton), for: .touchUpInside)
        return button
    }()

    private let dataLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .gray
        label.text = "Соглашаюсь на обработку персональных данных"
        return label
    }()

    private let sendButton: BigButtonUI = {
        let button = BigButtonUI(title: "Отправить")
        //        button.isHidden = true
        return button
    }()

    private var isEmpty = true

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
        view.addSubviews(
            [
                closeButton,
                titleLabel,
                descriptionLabel,
                nameTextField,
                numberPhoneTextField,
                emailTextField,
                applicationTextField,
                checkButton,
                dataLabel,
                sendButton
            ]
        )
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
            descriptionLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),

            nameTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            nameTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            nameTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),

            numberPhoneTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            numberPhoneTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            numberPhoneTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),

            emailTextField.topAnchor.constraint(equalTo: numberPhoneTextField.bottomAnchor, constant: 20),
            emailTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            emailTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),

            applicationTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            applicationTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            applicationTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),

            checkButton.topAnchor.constraint(equalTo: applicationTextField.bottomAnchor, constant: 20),
            checkButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            checkButton.heightAnchor.constraint(equalToConstant: 25),
            checkButton.widthAnchor.constraint(equalToConstant: 25),

            dataLabel.leftAnchor.constraint(equalTo: checkButton.rightAnchor, constant: 10),
            dataLabel.centerYAnchor.constraint(equalTo: checkButton.centerYAnchor),

            sendButton.topAnchor.constraint(equalTo: dataLabel.bottomAnchor, constant: 20),
            sendButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            sendButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        ])
    }
}

// MARK: - Actions
private extension ApplicationViewController {
    @objc
    func tupCloseButton() {
        dismiss(animated: true)
    }

    @objc
    func tupCheckButton(sender: UIButton) {
        if !isEmpty {
            sender.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
            sender.tintColor = AbadaColors.Color(resource: .abadaPrimary)
            isEmpty.toggle()
            sendButton.isHidden = false
        } else if isEmpty {
            sender.setImage(UIImage(systemName: "square"), for: .normal)
            sender.tintColor = .gray
            isEmpty.toggle()
            sendButton.isHidden = true
        }
    }
}
