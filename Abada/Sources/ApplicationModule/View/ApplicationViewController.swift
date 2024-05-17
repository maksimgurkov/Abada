import UIKit
import AbadaUI
import MessageUI
import SafariServices

// MARK: - ApplicationViewController
final class ApplicationViewController: UIViewController {

    // MARK: - Private properties
    private let presenter: ApplicationPresenterProtocol

    private lazy var closeButton: CloseButtonUI = {
        let button = CloseButtonUI()
        button.addTarget(self, action: #selector(tupCloseButton), for: .touchUpInside)
        return button
    }()

    private let titleLabel = HeaderLabelUI(text: "")
    private let descriptionLabel = SmallLabelUI(text: "")

    private let nameTextField: CustomTextFieldUI = {
        let textField = CustomTextFieldUI(placeholder: "Имя")
        textField.isOn = true
        return textField
    }()

    private let numberPhoneTextField: CustomTextFieldUI = {
        let textField = CustomTextFieldUI(placeholder: "Телефон")
        textField.keyboardType = .numberPad
        textField.isOn = true
        return textField
    }()

    private let wishListTextField: CustomTextFieldUI = {
        return CustomTextFieldUI(placeholder: "Что нужно сделать")
    }()

    private lazy var checkButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        button.tintColor = AbadaColors.Color(resource: .abadaAcent)
        button.addTarget(self, action: #selector(tupCheckButton), for: .touchUpInside)
        return button
    }()

    private lazy var consentButton: UIButton = {
        let button = UIButton()
        button.setTitle("Согласие на обработку персональных данных", for: .normal)
        button.setTitleColor(AbadaColors.Color(resource: .abadaText), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.titleLabel?.numberOfLines = 2
        button.addTarget(self, action: #selector(tupShowConsent), for: .touchUpInside)
        return button
    }()

    private lazy var sendButton: BigButtonUI = {
        let button = BigButtonUI(title: "Отправить")
        button.addTarget(self, action: #selector(checkingForEmptyString), for: .touchUpInside)
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

    // Скрытие клавиатуры
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }

    func displayAlert(title: String, message: String, completionHandler: (() -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            completionHandler?()
        }
        alert.addAction(okAction)

        present(alert, animated: true, completion: nil)
    }

    private func clearTextField() {
        nameTextField.text = nil
        numberPhoneTextField.text = nil
        wishListTextField.text = nil
    }
}

// MARK: - ApplicationInput
extension ApplicationViewController: ApplicationInput { }

// MARK: - SetupView
private extension ApplicationViewController {
    func setupView() {
        view.backgroundColor = AbadaColors.Color(resource: .abadaBackground)
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
                wishListTextField,
                checkButton,
                sendButton,
                consentButton
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

            wishListTextField.topAnchor.constraint(equalTo: numberPhoneTextField.bottomAnchor, constant: 20),
            wishListTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            wishListTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),

            checkButton.topAnchor.constraint(equalTo: wishListTextField.bottomAnchor, constant: 20),
            checkButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            checkButton.heightAnchor.constraint(equalToConstant: 15),
            checkButton.widthAnchor.constraint(equalToConstant: 15),

            consentButton.leftAnchor.constraint(equalTo: checkButton.rightAnchor, constant: 5),
            consentButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            consentButton.centerYAnchor.constraint(equalTo: checkButton.centerYAnchor),

            sendButton.topAnchor.constraint(equalTo: consentButton.bottomAnchor, constant: 20),
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
    func tupShowConsent() {
        if let url = URL(string: "https://abada.ru/include/licenses_detail.php") {
            let safariVC = SFSafariViewController(url: url)
            present(safariVC, animated: true, completion: nil)
        }
    }

    @objc
    func tupCheckButton(sender: UIButton) {
        if !isEmpty {
            sender.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
            sender.tintColor = AbadaColors.Color(resource: .abadaAcent)
            isEmpty.toggle()
            sendButton.isHidden = false
        } else if isEmpty {
            sender.setImage(UIImage(systemName: "square"), for: .normal)
            sender.tintColor = AbadaColors.Color(resource: .abadaAcent)
            isEmpty.toggle()
            sendButton.isHidden = true
        }
    }

    @objc
    func checkingForEmptyString() {
        if nameTextField.text != "" && numberPhoneTextField.text != "" {
            tupSendTelegram()
            tupSendEmail()
        } else {
            displayAlert(
                title: "Ошибка",
                message: "Заполните обязательные поля *",
                completionHandler: nil
            )
        }
    }

    @objc
    func tupSendTelegram() {
        let name = "Имя: \(nameTextField.text ?? "")"
        let phone = "Телефон: \(numberPhoneTextField.text ?? "")"
        let wishList = "Нужно: \(wishListTextField.text ?? "")"

        let bodyMail = """
\(name)
\(phone)
\(wishList)
"""
        guard let path = Bundle.main.path(forResource: "Token", ofType: "plist"),
              let keys = NSDictionary(contentsOfFile: path),
              let telegramBotToken = keys["TelegramToken"] as? String,
              let telegramChatId = keys["TelegramChatId"] as? String
        else {
            fatalError("Не удалось загрузить или прочитать файл Token.plist")
        }

        let urlString = "https://api.telegram.org/bot\(telegramBotToken)/sendMessage?chat_id=\(telegramChatId)&text=\(bodyMail)"

        if let url = URL(string: urlString) {
            let task = URLSession.shared.dataTask(with: url) { (_, _, error) in
                if error != nil {
                    DispatchQueue.main.async {
                        self.displayAlert(
                            title: "Упс... Что-то пошло не так...",
                            message: "Пожалуйса, свяжитесь с нами",
                            completionHandler: nil
                        )
                    }
                } else {
                    DispatchQueue.main.async {
                        self.displayAlert(
                            title: "Заявка принята",
                            message: "В ближайшее время с вами свяжутся, пожалуйста ожидайте",
                            completionHandler: {
                                self.tupCloseButton()
                                self.clearTextField()
                            }
                        )
                    }
                }
            }
            task.resume()
        }
    }

    @objc
    func tupSendEmail() {
        let mailComposeViewController = configureMailComposer()

        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        }
    }
}

// MARK: - MFMailComposeViewControllerDelegate
extension ApplicationViewController: MFMailComposeViewControllerDelegate {
    private func configureMailComposer() -> MFMailComposeViewController {
        let mailComposeVC = MFMailComposeViewController()

        let name = "Имя: \(nameTextField.text ?? "")"
        let phone = "Телефон: \(numberPhoneTextField.text ?? "")"
        let wishList = "Нужно: \(wishListTextField.text ?? "")"

        let bodyMail = """
 \(name)
 \(phone)
 \(wishList)
 """

        mailComposeVC.mailComposeDelegate = self
        mailComposeVC.setToRecipients(["solodyankin.ie@ya.ru"])
        mailComposeVC.setSubject("Заявка из приложения!")
        mailComposeVC.setMessageBody("\(bodyMail)", isHTML: false)

        return mailComposeVC
    }

    // Отправка письма и закрытие текущего экрана
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: (any Error)?) {

        switch result {
        case .sent:
            DispatchQueue.main.async {
                self.tupCloseButton()
                self.displayAlert(
                    title: "Заявка принята",
                    message: "В ближайшее время с вами свяжутся, пожалуйста ожидайте",
                    completionHandler: nil
                )
                self.clearTextField()
            }
        default:
            break
        }
        controller.dismiss(animated: true, completion: nil)
    }
}
