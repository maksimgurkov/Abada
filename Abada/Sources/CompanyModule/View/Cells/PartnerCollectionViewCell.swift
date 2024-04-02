import UIKit

// MARK: - PartnerCollectionCell
final class PartnerCollectionViewCell: UICollectionViewCell {

    // MARK: - Private properties
    private let photoImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 8
        image.clipsToBounds = true
        return image
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
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
            //            photoImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            //            photoImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            //            photoImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            //            photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            photoImageView.heightAnchor.constraint(equalToConstant: 50),
            photoImageView.widthAnchor.constraint(equalToConstant: 100),

            //            titleLabel.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 10),
            titleLabel.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: photoImageView.centerXAnchor)
        ])
    }
}
