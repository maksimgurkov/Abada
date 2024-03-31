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
        backgroundColor = .secondarySystemBackground
        tintColor = #colorLiteral(red: 1, green: 0.8666666667, blue: 0.1764705882, alpha: 1)
        layer.cornerRadius = height / 2

        heightAnchor.constraint(equalToConstant: height).isActive = true
        widthAnchor.constraint(equalToConstant: height).isActive = true
    }

}
