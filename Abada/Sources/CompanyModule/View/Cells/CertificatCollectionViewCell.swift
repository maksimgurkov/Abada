import UIKit

// MARK: - CertificatCollectionCell
final class CertificatCollectionViewCell: UICollectionViewCell {

    // MARK: - Private properties
    private let photoImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func fill(image: String, title: String, description: String) {
        self.photoImageView.image = UIImage(named: image)
        self.titleLabel.text = title
        self.descriptionLabel.text = description
    }
}

// MARK: - SetupView
private extension CertificatCollectionViewCell {
    func setupView() {
        backgroundColor = .secondarySystemBackground
        layer.cornerRadius = 15

        addSubView()
        setConstraints()
    }
}

// MARK: - Setting
private extension CertificatCollectionViewCell {
    func addSubView() {
        contentView.addSubviews([
            photoImageView,
            titleLabel,
            descriptionLabel
        ])
    }
}

// MARK: - Layput
private extension CertificatCollectionViewCell {
    func setConstraints() {
        NSLayoutConstraint.activate([
            photoImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            photoImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            photoImageView.widthAnchor.constraint(equalToConstant: 100),
            photoImageView.heightAnchor.constraint(equalToConstant: 150),

            titleLabel.topAnchor.constraint(equalTo: photoImageView.topAnchor, constant: 8),
            titleLabel.leftAnchor.constraint(equalTo: photoImageView.rightAnchor, constant: 20),

            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            descriptionLabel.leftAnchor.constraint(equalTo: photoImageView.rightAnchor, constant: 20),
            descriptionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20)
        ])
    }
}
