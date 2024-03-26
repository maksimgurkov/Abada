import UIKit

// MARK: - ChatTableViewCell
final class BotMessageTableViewCell: UITableViewCell {

    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        view.layer.cornerRadius = 15
        return view
    }()

    private let tailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "triangle.fill")
        imageView.tintColor = .secondarySystemBackground
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "avatar_bot")
        imageView.layer.cornerRadius = 25
        imageView.clipsToBounds = true
        return imageView
    }()

    private let messageLabel: UILabel = {
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

    func fill(text: String, image: String) {
        self.avatarImageView.image = UIImage(named: image)
        self.messageLabel.text = text
    }
}

// MARK: - SetupView
private extension BotMessageTableViewCell {
    func setupView() {
        selectionStyle = .none
        addSubView()
        setConstraints()
    }
}

// MARK: - Setting
private extension BotMessageTableViewCell {
    func addSubView() {
        contentView.addSubviews([
            avatarImageView,
            containerView,
            tailImageView,
            messageLabel
        ])
    }
}

// MARK: - Layout
private extension BotMessageTableViewCell {
    func setConstraints() {
        NSLayoutConstraint.activate([
            avatarImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            avatarImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            avatarImageView.heightAnchor.constraint(equalToConstant: 50),
            avatarImageView.widthAnchor.constraint(equalToConstant: 50),

            messageLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            messageLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 30),
            messageLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30),
            messageLabel.rightAnchor.constraint(lessThanOrEqualTo: contentView.rightAnchor, constant: -30),

            containerView.topAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -15),
            containerView.leftAnchor.constraint(equalTo: messageLabel.leftAnchor, constant: -15),
            containerView.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 15),
            containerView.rightAnchor.constraint(equalTo: messageLabel.rightAnchor, constant: 15),

            tailImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 3),
            tailImageView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: -9),
            tailImageView.heightAnchor.constraint(equalToConstant: 30),
            tailImageView.widthAnchor.constraint(equalToConstant: 30)
        ])
    }
}
