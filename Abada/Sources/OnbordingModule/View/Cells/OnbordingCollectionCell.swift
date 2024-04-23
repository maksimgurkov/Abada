import UIKit

// MARK: - MainCollectionCell
final class OnbordingCollectionCell: UICollectionViewCell {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 0
        label.text = "Добро пожаловать в наше приложение для ремонта под ключ!"
        return label
    }()

    private let photoImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "city")
        return image
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func fill(viewModel: OnbordingViewModel) {
        self.photoImageView.image = UIImage(named: viewModel.image)
        self.titleLabel.text = viewModel.title
    }
}

// MARK: - Setup
private extension OnbordingCollectionCell {
    func setupView() {
        addSubView()
        setConstraint()
        backgroundColor = AbadaColors.Color(resource: .abadaBackground)
    }
}

// MARK: - Setting
private extension OnbordingCollectionCell {
    func addSubView() {
        contentView.addSubviews([
            photoImageView,
            titleLabel
        ])
    }
}

// MARK: - Layout
private extension OnbordingCollectionCell {
    func setConstraint() {
        NSLayoutConstraint.activate([
            photoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            photoImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -50),
            photoImageView.heightAnchor.constraint(equalToConstant: 250),
            photoImageView.widthAnchor.constraint(equalToConstant: 250),

            titleLabel.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 20),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20)
        ])
    }
}
