import UIKit

// MARK: - TransparentButtonUI
public final class TransparentButtonUI: UIButton {

    // MARK: - Initialize
    public init(systemName: String) {
        super.init(frame: .zero)
        setupButton(systemName: systemName)
        addTarget(self, action: #selector(buttonPressed), for: .touchDown)
        addTarget(self, action: #selector(buttonReleased), for: .touchUpInside)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupButton(systemName: String) {
        setImage(UIImage(systemName: systemName), for: .normal)
        tintColor = UIColor(named: "abadaAcent")
    }

    // MARK: - Button Actions
    @objc private func buttonPressed() {
        UIView.animate(withDuration: 0.5) {
            self.alpha = 0.3
        }
    }

    @objc private func buttonReleased() {
        UIView.animate(withDuration: 0.5) {
            self.alpha = 1
        }
    }
}
