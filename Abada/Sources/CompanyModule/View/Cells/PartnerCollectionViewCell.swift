import UIKit
import AbadaUI

// MARK: - PartnerCollectionCell
final class PartnerCollectionViewCell: UICollectionViewCell {

    // MARK: - Private properties
    private let photoImageView = PhotoImageViewUI(image: "")

    private let titleLabel: TitleLabelUI = {
        let label = TitleLabelUI(text: "")
        label.textColor = .systemGray2
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func fill(image: String, title: String) {
        self.photoImageView.image = UIImage(named: image)
        self.titleLabel.text = title
    }
}

// MARK: - SetupView
private extension PartnerCollectionViewCell {
    func setupView() {
        addSubView()
        setConstraints()
    }
}

// MARK: - Setting
private extension PartnerCollectionViewCell {
    func addSubView() {
        contentView.addSubviews([
            photoImageView,
            titleLabel
        ])
    }
}

// MARK: - Layout
private extension PartnerCollectionViewCell {
    func setConstraints() {
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            photoImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            photoImageView.heightAnchor.constraint(equalToConstant: 50),

            titleLabel.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 5),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: photoImageView.centerXAnchor)
        ])
    }
}
