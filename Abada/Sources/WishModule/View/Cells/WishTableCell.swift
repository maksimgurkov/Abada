import UIKit
import AbadaUI

// MARK: - WishTableCell
final class WishTableCell: UITableViewCell {
    // MARK: - Private properties
    lazy var titleLabel: TitleLabelUI = {
        let label = TitleLabelUI(text: "")
        return label
    }()

    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public methods
    func fill(viewModel: String) {
        self.titleLabel.text = viewModel
    }
}

// MARK: - SetupView
private extension WishTableCell {
    func setupView() {
        selectionStyle = .none
        backgroundColor = AbadaColors.Color(resource: .abadaBackground)
        addSubView()
        setConstraints()
    }
}

// MARK: - Setting
private extension WishTableCell {
    func addSubView() {
        contentView.addSubviews([
            titleLabel
        ])
    }
}

// MARK: - Layout
private extension WishTableCell {
    func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20)
        ])
    }
}
