import UIKit

// MARK: - MainCollectionCell
final class OnbordingCollectionCell: UICollectionViewCell {

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup
private extension OnbordingCollectionCell {
    func setupView() {
        addSubView()
        setConstraint()
        contentView.backgroundColor = .red
    }
}

// MARK: - Setting
private extension OnbordingCollectionCell {
    func addSubView() {
        contentView.addSubviews([

        ])
    }
}

// MARK: - Layout
private extension OnbordingCollectionCell {
    func setConstraint() {
        NSLayoutConstraint.activate([

        ])
    }
}
