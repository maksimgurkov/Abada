import UIKit

// MARK: - CertificateHeaderCell
final class CertificateHeaderCell: UITableViewCell {

    // MARK: - Private properties
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24)
        label.numberOfLines = 0
        return label
    }()

    private let seporatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
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

    func fill(title: String) {
        self.titleLabel.text = title
    }
}

// MARK: - SetupView
private extension CertificateHeaderCell {
    func setupView() {
        addSubView()
        setConstraints()
    }
}

// MARK: - Setting
private extension CertificateHeaderCell {
    func addSubView() {
        contentView.addSubviews([
            titleLabel,
            seporatorView
        ])
    }
}

// MARK: - Layout
private extension CertificateHeaderCell {
    func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            titleLabel.bottomAnchor.constraint(equalTo: seporatorView.topAnchor, constant: 8),

            seporatorView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            seporatorView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            seporatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
}
