import UIKit

// MARK: - DetailServiceArticleCell
final class DetailServiceArticleCell: UITableViewCell {

    // MARK: - Private properties
    lazy var articleLabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func fill(viewModel: DetailArticleViewModel) {
        self.articleLabel.text = viewModel.text
    }
}

// MARK: - SetupView
private extension DetailServiceArticleCell {
    func setupView() {
        selectionStyle = .none
        addSubView()
        setConstraints()
    }
}

// MARK: - Setting
private extension DetailServiceArticleCell {
    func addSubView() {
        contentView.addSubviews([
            articleLabel
        ])
    }
}

// MARK: - Layout
private extension DetailServiceArticleCell {
    func setConstraints() {
        NSLayoutConstraint.activate([
            articleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            articleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            articleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            articleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20)
        ])
    }
}
