import UIKit

// MARK: - CloseButtonUI
public final class CloseButtonUI: UIButton {

    private let height: CGFloat = 35

    // MARK: - Initialisers
    public init() {
        super.init(frame: .zero)
        setupButton()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Private Methods
    private func setupButton() {
        setImage(UIImage(systemName: "xmark"), for: .normal)
        backgroundColor = .systemGray6
        tintColor = #colorLiteral(red: 0.6082915664, green: 0.3423695564, blue: 0.268579036, alpha: 1)
        layer.cornerRadius = height / 2

        heightAnchor.constraint(equalToConstant: 35).isActive = true
        widthAnchor.constraint(equalToConstant: 35).isActive = true
    }

}
