import UIKit
import AbadaUI

// MARK: - ChatTableViewCell
final class UserMessageTableViewCell: UITableViewCell {

    // MARK: Private property
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = AbadaColors.Color(resource: .abadaAcent)
        view.layer.cornerRadius = 15
        return view
    }()

    private let tailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "triangle.fill")
        imageView.tintColor = AbadaColors.Color(resource: .abadaAcent)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 25
        imageView.clipsToBounds = true
        return imageView
    }()

    private let messageLabel: SmallLabelUI = {
        let label = SmallLabelUI(text: "")
        label.textColor = AbadaColors.Color(resource: .abadaTextInversion)
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
private extension UserMessageTableViewCell {
    func setupView() {
        selectionStyle = .none
        backgroundColor = AbadaColors.Color(resource: .abadaBackground)
        addSubView()
        setConstraints()
    }
}

// MARK: - Setting
private extension UserMessageTableViewCell {
    func addSubView() {
        contentView.addSubviews([
            avatarImageView,
            tailImageView,
            containerView,
            messageLabel
        ])
    }
}

// MARK: - Layout
private extension UserMessageTableViewCell {
    func setConstraints() {
        NSLayoutConstraint.activate([
            avatarImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            avatarImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            avatarImageView.heightAnchor.constraint(equalToConstant: 50),
            avatarImageView.widthAnchor.constraint(equalToConstant: 50),

            messageLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            messageLabel.leftAnchor.constraint(greaterThanOrEqualTo: contentView.leftAnchor, constant: 30),
            messageLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30),
            messageLabel.rightAnchor.constraint(equalTo: avatarImageView.leftAnchor, constant: -30),

            containerView.topAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -15),
            containerView.leftAnchor.constraint(equalTo: messageLabel.leftAnchor, constant: -15),
            containerView.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 15),
            containerView.rightAnchor.constraint(equalTo: messageLabel.rightAnchor, constant: 15),

            tailImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 3),
            tailImageView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 9),
            tailImageView.heightAnchor.constraint(equalToConstant: 30),
            tailImageView.widthAnchor.constraint(equalToConstant: 30)
        ])
    }
}
