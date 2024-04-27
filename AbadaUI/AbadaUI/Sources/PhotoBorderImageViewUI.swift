import UIKit

// MARK: - PhotoBorderImageViewUI
public final class PhotoBorderImageViewUI: UIImageView {

    // MARK: - Initializer
    public init(image: String) {
        super.init(frame: .zero)
        setupImageView(image: image)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private methods
    private func setupImageView(image: String) {
        contentMode = .scaleAspectFill
        layer.cornerRadius = 8
        clipsToBounds = true
        layer.borderColor = UIColor(named: "abadaAcent")?.cgColor
        layer.borderWidth = 1
    }
}
