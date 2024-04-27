import UIKit

// MARK: - ExtraSmallLabelUI
public final class ExtraSmallLabelUI: UILabel {
    // MARK: - Initializer
    public init() {
        super.init(frame: .zero)
        setupLabel()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private methods
    private func setupLabel() {
        textColor = UIColor(named: "abadaText")
        numberOfLines = 0
        font = UIFont.systemFont(ofSize: 12)
    }
}
