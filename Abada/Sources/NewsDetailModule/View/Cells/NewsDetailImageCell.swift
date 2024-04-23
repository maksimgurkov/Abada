import UIKit

// MARK: - NewsDetailTitleCell
final class NewsDetailImageCell: UITableViewCell {

    private let newsImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 8
        image.clipsToBounds = true
        return image
    }()

    // MARK: - Initialisers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func fill(image: String) {
        self.newsImage.image = UIImage(named: image)
    }
}

// MARK: - SetupView
private extension NewsDetailImageCell {
    func setupView() {
        selectionStyle = .none
        backgroundColor = AbadaColors.Color(resource: .abadaBackground)
        addSubView()
        setConstraints()
    }
}

// MARK: - Setting
private extension NewsDetailImageCell {
    func addSubView() {
        contentView.addSubviews([newsImage])
    }
}

// MARK: - Layout
private extension NewsDetailImageCell {
    func setConstraints() {
        NSLayoutConstraint.activate([
            newsImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            newsImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            newsImage.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            newsImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            newsImage.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}
