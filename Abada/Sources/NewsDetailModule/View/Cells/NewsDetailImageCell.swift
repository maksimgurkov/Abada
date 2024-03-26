import UIKit

// MARK: - NewsDetailTitleCell
final class NewsDetailImageCell: UITableViewCell {

    private let newsImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
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
            newsImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            newsImage.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            newsImage.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            newsImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
