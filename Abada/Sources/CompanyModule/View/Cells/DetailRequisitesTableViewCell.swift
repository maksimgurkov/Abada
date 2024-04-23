import UIKit

// MARK: - RequisitesTableViewCell
final class DetailRequisitesTableViewCell: UITableViewCell {

    // MARK: - Private properties
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.numberOfLines = 0
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        return label
    }()

    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func fill(title: String, description: String) {
        self.titleLabel.text = title
        self.descriptionLabel.text = description
    }
}

// MARK: - SetupView
private extension DetailRequisitesTableViewCell {
    func setupView() {
        selectionStyle = .none
        backgroundColor = AbadaColors.Color(resource: .abadaBackground)
        addSubView()
        setConstraints()
    }
}

// MARK: - SettingView
private extension DetailRequisitesTableViewCell {
    func addSubView() {
        contentView.addSubviews([
            titleLabel,
            descriptionLabel
        ])
    }
}

// MARK: - Layout
private extension DetailRequisitesTableViewCell {
    func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),

            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            descriptionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            descriptionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
}
