import UIKit
import AbadaUI

final class PersonDiscountViewController: UIViewController {

    // MARK: - Private propertyes
    private let presenter: PersonDiscountPresenterProtocol

    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 20
        return view
    }()

    private let substrateView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 0.8666666667, blue: 0.1764705882, alpha: 1)
        view.layer.cornerRadius = 8
        return view
    }()

    private let discountLabel: UILabel = {
        let label = UILabel()
        label.text = "-30%"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 50)
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "На монтаж радиаторов отопления и систем кондиционирования."
        label.numberOfLines = 0
        return label
    }()

    private let couponLabel: UILabel = {
        let label = UILabel()
        label.text = "ABADA30"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .black
        return label
    }()

    private let validityPeriodLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Действует с 26.03.2024 по 31.03.2024"
        return label
    }()

    private lazy var closeButton: CloseButtonUI = {
        let button = CloseButtonUI()
        button.addTarget(self, action: #selector(tupCloseButton), for: .touchUpInside)
        return button
    }()

    // MARK: - Init
    init(presenter: PersonDiscountPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        setupView()
    }
}

// MARK: - PersonDiscountInput
extension PersonDiscountViewController: PersonDiscountInput {

}

// MARK: - setuView
private extension PersonDiscountViewController {
    func setupView() {
        view.backgroundColor = .clear
        addSubView()
        setConstraints()
    }
}

// MARK: - Setting
private extension PersonDiscountViewController {
    func addSubView() {
        view.addSubviews([
            backgroundView,
            substrateView,
            closeButton,
            discountLabel,
            descriptionLabel,
            couponLabel,
            validityPeriodLabel
        ])
    }
}

// MARK: - Layout
private extension PersonDiscountViewController {
    func setConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundView.leftAnchor.constraint(equalTo: view.leftAnchor),
            backgroundView.rightAnchor.constraint(equalTo: view.rightAnchor),
            backgroundView.heightAnchor.constraint(equalToConstant: 400),

            substrateView.topAnchor.constraint(equalTo: couponLabel.topAnchor, constant: -20),
            substrateView.leftAnchor.constraint(equalTo: couponLabel.leftAnchor, constant: -20),
            substrateView.rightAnchor.constraint(equalTo: couponLabel.rightAnchor, constant: 20),
            substrateView.bottomAnchor.constraint(equalTo: couponLabel.bottomAnchor, constant: 20),

            closeButton.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 20),
            closeButton.rightAnchor.constraint(equalTo: backgroundView.rightAnchor, constant: -20),

            discountLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 40),
            discountLabel.leftAnchor.constraint(equalTo: backgroundView.leftAnchor, constant: 20),
            discountLabel.rightAnchor.constraint(equalTo: backgroundView.rightAnchor, constant: -20),

            descriptionLabel.topAnchor.constraint(equalTo: discountLabel.bottomAnchor, constant: 20),
            descriptionLabel.leftAnchor.constraint(equalTo: backgroundView.leftAnchor, constant: 20),
            descriptionLabel.rightAnchor.constraint(equalTo: backgroundView.rightAnchor, constant: -20),

            couponLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 40),
            couponLabel.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),

            validityPeriodLabel.topAnchor.constraint(equalTo: couponLabel.bottomAnchor, constant: 40),
            validityPeriodLabel.leftAnchor.constraint(equalTo: backgroundView.leftAnchor, constant: 20),
            validityPeriodLabel.rightAnchor.constraint(equalTo: backgroundView.rightAnchor, constant: -20)
        ])
    }
}

// MARK: - Action
private extension PersonDiscountViewController {
    @objc func tupCloseButton() {
        dismiss(animated: true)
    }
}
