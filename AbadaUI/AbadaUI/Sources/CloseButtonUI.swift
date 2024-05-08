import UIKit

// MARK: - CloseButtonUI
public final class CloseButtonUI: UIButton {

    private let height: CGFloat = 35

    // MARK: - Initialize
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
        backgroundColor = .tertiarySystemBackground
        tintColor = UIColor(named: "abadaAcent")
        layer.cornerRadius = height / 2

        heightAnchor.constraint(equalToConstant: height).isActive = true
        widthAnchor.constraint(equalToConstant: height).isActive = true
    }

}
