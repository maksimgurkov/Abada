import UIKit
import AbadaUI

// MARK: - CertificateHeaderCell
final class HeaderTableViewCell: UITableViewCell {

    // MARK: - Private properties
    private let titleLabel = HeaderLabelUI(text: "")

    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func fill(title: String) {
        self.titleLabel.text = title
    }
}

// MARK: - SetupView
private extension HeaderTableViewCell {
    func setupView() {
        selectionStyle = .none
        backgroundColor = AbadaColors.Color(resource: .abadaBackground)
        addSubView()
        setConstraints()
    }
}

// MARK: - Setting
private extension HeaderTableViewCell {
    func addSubView() {
        contentView.addSubviews([
            titleLabel
        ])
    }
}

// MARK: - Layout
private extension HeaderTableViewCell {
    func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
}
