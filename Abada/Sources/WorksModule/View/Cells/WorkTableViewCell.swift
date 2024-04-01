import UIKit

// MARK: - PriceTableViewCell
final class WorkTableViewCell: UITableViewCell {

    // MARK: - Private properties
    private let titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    private let nextImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "chevron.right")
        image.tintColor = #colorLiteral(red: 1, green: 0.8666666667, blue: 0.1764705882, alpha: 1)
        return image
    }()

    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public functions
    func fill(viewModel: WorkViewModel) {
        self.titleLabel.text = viewModel.title
    }
}

// MARK: - SetupView
private extension WorkTableViewCell {
    func setupView() {
        selectionStyle = .none
        addSubView()
        setConstraints()
    }
}

// MARK: - Setting
private extension WorkTableViewCell {
    func addSubView() {
        contentView.addSubviews([titleLabel, nextImage])
    }
}

// MARK: - Layout
private extension WorkTableViewCell {
    func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            titleLabel.rightAnchor.constraint(equalTo: nextImage.leftAnchor, constant: 20),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),

            nextImage.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            nextImage.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20)
        ])
    }
}
