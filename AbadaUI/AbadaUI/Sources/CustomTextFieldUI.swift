import UIKit

// MARK: - CustomTextFieldUI
public final class CustomTextFieldUI: UITextField {

    private let padding = UIEdgeInsets(
        top: 0,
        left: 20,
        bottom: 0,
        right: 20
    )

    private let starLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "*"
        label.textColor = UIColor(named: "abadaAcent")
        label.isHidden = true
        return label
    }()

    public var isOn: Bool = false {
        didSet {
            starLabel.isHidden = !isOn
        }
    }

    // MARK: - Init
    public init(placeholder: String) {
        super.init(frame: .zero)
        setupTextField(placeholder: placeholder)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Override Methods
    public override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }

    public override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }

    public override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }

    private func setupTextField(placeholder: String) {
        self.placeholder = placeholder
        layer.cornerRadius = 8
        backgroundColor = .systemGray6
        layer.borderColor = UIColor(named: "abadaGray")?.cgColor
        layer.borderWidth = 1.0
        heightAnchor.constraint(equalToConstant: 44).isActive = true

        addSubView()
        setConstraints()
    }
}

// MARK: - Add Elements
private  extension CustomTextFieldUI {
    // MARK: - Setting
    func addSubView() {
        addSubview(starLabel)
    }

    // MARK: - Layout
    func setConstraints() {
        NSLayoutConstraint.activate([
            starLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            starLabel.rightAnchor.constraint(equalTo: self.leftAnchor, constant: -5)
        ])
    }
}
