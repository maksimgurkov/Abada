import UIKit
import AbadaUI

// MARK: - DetailServiceTitleCell
final class DetailServiceTitleCell: UITableViewCell {

    // MARK: - Private properties
    lazy var titleLabel = TitleLabelUI(text: "")

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func fill(viewModel: DetailTitleViewModel) {
        self.titleLabel.text = viewModel.text
    }
}

// MARK: - SetupView
private extension DetailServiceTitleCell {
    func setupView() {
        selectionStyle = .none
        backgroundColor = AbadaColors.Color(resource: .abadaBackground)
        addSubView()
        setConstraints()
    }
}

// MARK: - Setting
private extension DetailServiceTitleCell {
    func addSubView() {
        contentView.addSubviews([
            titleLabel
        ])
    }
}

// MARK: - Layout
private extension DetailServiceTitleCell {
    func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20)
        ])
    }
}
