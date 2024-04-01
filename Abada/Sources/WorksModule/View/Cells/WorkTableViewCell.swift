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

    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 0.8666666667, blue: 0.1764705882, alpha: 1)
        return view
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
        contentView.addSubviews([titleLabel, nextImage, separatorView])
    }
}

// MARK: - Layout
private extension WorkTableViewCell {
    func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            titleLabel.rightAnchor.constraint(equalTo: nextImage.leftAnchor, constant: 20),
            titleLabel.bottomAnchor.constraint(equalTo: separatorView.topAnchor, constant: -20),

            nextImage.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            nextImage.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),

            separatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            separatorView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            separatorView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            separatorView.heightAnchor.constraint(equalToConstant: 0.5)
        ])
    }
}
