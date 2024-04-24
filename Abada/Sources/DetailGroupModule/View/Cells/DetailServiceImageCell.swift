import UIKit
import AbadaUI

// MARK: - DetailServiceImageCell
final class DetailServiceImageCell: UITableViewCell {

    // MARK: - Private properties
    lazy var photoImageView = PhotoBorderImageViewUI(image: "")

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func fill(viewModel: DetailImageViewModel) {
        self.photoImageView.image = UIImage(named: viewModel.nameImage)
    }
}

// MARK: - SetupView
private extension DetailServiceImageCell {
    func setupView() {
        selectionStyle = .none
        backgroundColor = AbadaColors.Color(resource: .abadaBackground)
        addSubView()
        setConstraints()
    }
}

// MARK: - Setting
private extension DetailServiceImageCell {
    func addSubView() {
        contentView.addSubviews([
            photoImageView
        ])
    }
}

// MARK: - Layout
private extension DetailServiceImageCell {
    func setConstraints() {
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            photoImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            photoImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            photoImageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}
