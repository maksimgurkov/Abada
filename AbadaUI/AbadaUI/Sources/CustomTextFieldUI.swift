import UIKit

// MARK: - CustomTextFieldUI
public final class CustomTextFieldUI: UITextField {

    private let padding = UIEdgeInsets(
        top: 0,
        left: 20,
        bottom: 0,
        right: 20
    )

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
        layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        layer.borderWidth = 1.0
        heightAnchor.constraint(equalToConstant: 44).isActive = true
    }

}
