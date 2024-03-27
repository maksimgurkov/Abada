import UIKit

// MARK: - PartnerCollectionCell
final class PartnerCell: UICollectionViewCell {

    // MARK: - Private properties
    private let photoImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
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
private extension PartnerCell {
    func setupView() {
        addSubView()
        setConstraints()
    }
}

// MARK: - Setting
private extension PartnerCell {
    func addSubView() {
        contentView.addSubviews([
            photoImageView,
            titleLabel
        ])
    }
}

// MARK: - Layout
private extension PartnerCell {
    func setConstraints() {
        NSLayoutConstraint.activate([
            photoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            photoImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -20),
            photoImageView.heightAnchor.constraint(equalToConstant: 50),
            photoImageView.widthAnchor.constraint(equalToConstant: 100),

            titleLabel.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
}
