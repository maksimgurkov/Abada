import UIKit

// MARK: - NewsTableViewCell
final class NewsTableViewCell: UITableViewCell {

    // MARK: - Private properties
    private let newsImage: UIImageView = {
        let image = UIImageView()
        return image
    }()

    private let newsTitle: UILabel = {
        let label = UILabel()
        label.textColor = .black
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
        self.newsTitle.text = viewModel.title
        self.subTitle.text = viewModel.subTitle
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
            newsImage.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            newsImage.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            newsImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),

            newsTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
            newsTitle.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),

            subTitle.topAnchor.constraint(equalTo: newsTitle.bottomAnchor, constant: 20),
            subTitle.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            subTitle.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20)
        ])
    }
}
