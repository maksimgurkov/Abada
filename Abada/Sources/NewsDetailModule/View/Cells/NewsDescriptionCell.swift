import UIKit
import AbadaUI

// MARK: - NewsDescriptionCell
final class NewsDescriptionCell: UITableViewCell {

    // MARK: - Private properties
    private let descriptionLabel = SmallLabelUI(text: "")

    // MARK: - Initialisers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public functions
    func fill(description: String) {
        self.descriptionLabel.text = description
    }
}

// MARK: - SetupView
private extension NewsDescriptionCell {
    func setupView() {
        selectionStyle = .none
        backgroundColor = AbadaColors.Color(resource: .abadaBackground)
        addSubView()
        setConstraints()
    }
}

// MARK: - Setting
private extension NewsDescriptionCell {
    func addSubView() {
        contentView.addSubviews([descriptionLabel])
    }
}

// MARK: - Layout
private extension NewsDescriptionCell {
    func setConstraints() {
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            descriptionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            descriptionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
}
