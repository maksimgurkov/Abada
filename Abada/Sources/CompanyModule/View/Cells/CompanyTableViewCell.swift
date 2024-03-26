import UIKit

// MARK: - CompanyTableViewCell
final class CompanyTableViewCell: UITableViewCell {

    // MARK: Private property
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "123"
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

    func fill(viewModel: CompanyViewModel) {
        self.titleLabel.text = viewModel.title
    }
}

// MARK: - SetupView
private extension CompanyTableViewCell {
    func setupView() {
        selectionStyle = .none
        addSubView()
        setConstraints()
    }
}

// MARK: - Setting
private extension CompanyTableViewCell {
    func addSubView() {
        contentView.addSubviews([
            titleLabel
        ])
    }
}

// MARK: - Layout
private extension CompanyTableViewCell {
    func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 9),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20)
        ])
    }
}
