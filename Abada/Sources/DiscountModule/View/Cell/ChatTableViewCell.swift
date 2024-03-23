import UIKit

// MARK: - ChatTableViewCell
final class ChatTableViewCell: UITableViewCell {

    static let id = "ChatTableViewCell"

    private let maessageLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 17)
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

    func fill() {
        self.maessageLabel.text = "333"
    }
}

// MARK: - SetupView
private extension ChatTableViewCell {
    func setupView() {
        selectionStyle = .none
        addSubView()
        setConstraints()
    }
}

// MARK: - Setting
private extension ChatTableViewCell {
    func addSubView() {
        contentView.addSubviews([
            maessageLabel
        ])
    }
}

// MARK: - Layout
private extension ChatTableViewCell {
    func setConstraints() {
        NSLayoutConstraint.activate([
            maessageLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            maessageLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            maessageLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            maessageLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20)
        ])
    }
}
