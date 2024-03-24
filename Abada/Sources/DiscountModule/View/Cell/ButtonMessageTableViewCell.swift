import UIKit

// MARK: - ChatTableViewCell
final class ButtonMessageTableViewCell: UITableViewCell {

    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.6082915664, green: 0.3423695564, blue: 0.268579036, alpha: 1)
        button.layer.cornerRadius = 8
        return button
    }()

    // MARK: - Initialisers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func fill(title: String) {
        self.button.setTitle(title, for: .normal)
    }
}

// MARK: - SetupView
private extension ButtonMessageTableViewCell {
    func setupView() {
        selectionStyle = .none
        addSubView()
        setConstraints()
    }
}

// MARK: - Setting
private extension ButtonMessageTableViewCell {
    func addSubView() {
        contentView.addSubviews([
            button
        ])
    }
}

// MARK: - Layout
private extension ButtonMessageTableViewCell {
    func setConstraints() {
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            button.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            button.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            button.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}
