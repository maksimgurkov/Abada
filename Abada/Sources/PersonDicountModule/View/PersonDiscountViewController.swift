import UIKit
import AbadaUI

// MARK: - PersonDiscountViewController
final class PersonDiscountViewController: UIViewController {

    // MARK: - Private propertyes
    private let presenter: PersonDiscountPresenterProtocol

    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = AbadaColors.Color(resource: .abadaBackground)
        view.layer.cornerRadius = 8
        return view
    }()

    private let substrateView: UIView = {
        let view = UIView()
        view.backgroundColor = AbadaColors.Color(resource: .abadaAcent)
        view.layer.cornerRadius = 8
        return view
    }()

    private let discountLabel: LargeLabelUI = {
        let label = LargeLabelUI(text: "")
        return label
    }()

    private let descriptionLabel: SmallLabelUI = {
        let label = SmallLabelUI(text: "")
        return label
    }()

    private let couponLabel: LargeLabelUI = {
        let label = LargeLabelUI(text: "")
        label.textColor = AbadaColors.Color(resource: .abadaTextInversion)
        return label
    }()

    private let periodLabel: SmallLabelUI = {
        let label = SmallLabelUI(text: "")
        return label
    }()

    lazy var closingLeverView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.2964690924, green: 0.3058690429, blue: 0.3186741769, alpha: 1)
        view.layer.cornerRadius = 2
        return view
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
        presenter.updateData(
            discountLabel: discountLabel,
            descriptionLabel: descriptionLabel,
            couponLabel: couponLabel,
            periodLabel: periodLabel
        )

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
            closingLeverView,
            discountLabel,
            descriptionLabel,
            couponLabel,
            periodLabel
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

            closingLeverView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 20),
            closingLeverView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            closingLeverView.heightAnchor.constraint(equalToConstant: 4),
            closingLeverView.widthAnchor.constraint(equalToConstant: 80),

            substrateView.topAnchor.constraint(equalTo: couponLabel.topAnchor, constant: -20),
            substrateView.leftAnchor.constraint(equalTo: couponLabel.leftAnchor, constant: -20),
            substrateView.rightAnchor.constraint(equalTo: couponLabel.rightAnchor, constant: 20),
            substrateView.bottomAnchor.constraint(equalTo: couponLabel.bottomAnchor, constant: 20),

            discountLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 40),
            discountLabel.leftAnchor.constraint(equalTo: backgroundView.leftAnchor, constant: 20),
            discountLabel.rightAnchor.constraint(equalTo: backgroundView.rightAnchor, constant: -20),

            descriptionLabel.topAnchor.constraint(equalTo: discountLabel.bottomAnchor, constant: 20),
            descriptionLabel.leftAnchor.constraint(equalTo: backgroundView.leftAnchor, constant: 20),
            descriptionLabel.rightAnchor.constraint(equalTo: backgroundView.rightAnchor, constant: -20),

            couponLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 40),
            couponLabel.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),

            periodLabel.topAnchor.constraint(equalTo: couponLabel.bottomAnchor, constant: 40),
            periodLabel.leftAnchor.constraint(equalTo: backgroundView.leftAnchor, constant: 20),
            periodLabel.rightAnchor.constraint(equalTo: backgroundView.rightAnchor, constant: -20)
        ])
    }
}
