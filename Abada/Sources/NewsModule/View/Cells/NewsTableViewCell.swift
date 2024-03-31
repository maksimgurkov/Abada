import UIKit

// MARK: - NewsTableViewCell
final class NewsTableViewCell: UITableViewCell {

    // MARK: - Private properties
    private let newsImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 8
        image.layer.masksToBounds = true
        return image
    }()

    private let newsTitle: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()

    private let subTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()

    // MARK: - Initialisers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func fill(viewModel: NewsViewModel) {
        self.newsImage.image = UIImage(named: viewModel.image)
    }
}

// MARK: - SetupView
private extension NewsTableViewCell {
    func setupView() {
        selectionStyle = .none
        addSubView()
        setConstraints()
    }
}

// MARK: - Setting
private extension NewsTableViewCell {
    func addSubView() {
        contentView.addSubviews([newsImage, newsTitle, subTitle])
    }
}

// MARK: - Layout
private extension NewsTableViewCell {
    func setConstraints() {
        NSLayoutConstraint.activate([
            newsImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            newsImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            newsImage.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            newsImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),

            newsTitle.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            newsTitle.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            newsTitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
}
