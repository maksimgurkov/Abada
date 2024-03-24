import UIKit

// MARK: - BigButtonUI
public final class BigButtonUI: UIButton {

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
        backgroundColor = #colorLiteral(red: 0.6082915664, green: 0.3423695564, blue: 0.268579036, alpha: 1)
        layer.cornerRadius = 8

        heightAnchor.constraint(equalToConstant: 44).isActive = true
    }

}
