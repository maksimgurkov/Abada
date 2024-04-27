import UIKit

// MARK: - LargeLabelUI
public final class LargeLabelUI: UILabel {
    // MARK: - Initializer
    public init(text: String) {
        super.init(frame: .zero)
        setupLabel(text: text)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private methods
    private func setupLabel(text: String) {
        textColor = UIColor(named: "abadaText")
        numberOfLines = 0
        textAlignment = .center
        font = UIFont.boldSystemFont(ofSize: 30)
    }
}
