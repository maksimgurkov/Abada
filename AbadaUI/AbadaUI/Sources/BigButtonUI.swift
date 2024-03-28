import UIKit

// MARK: - BigButtonUI
public final class BigButtonUI: UIButton {

    // MARK: - Initialisers
    public init(title: String) {
        super.init(frame: .zero)
        setupButton(title: title)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Private Methods
    private func setupButton(title: String) {
        setTitle(title, for: .normal)
        backgroundColor = #colorLiteral(red: 1, green: 0.8666666667, blue: 0.1764705882, alpha: 1)
        setTitleColor(.black, for: .normal)
        layer.cornerRadius = 8
        heightAnchor.constraint(equalToConstant: 44).isActive = true
    }

}
