import UIKit

// MARK: - ChatTableViewCell
final class ButtonMessageTableViewCell: UITableViewCell {

    private var viewModel: ButtonViewModel?

    private lazy var discountButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.6078431373, green: 0.3411764706, blue: 0.2666666667, alpha: 1)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(tupDiscountButton), for: .touchUpInside)
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

    func fill(viewModel: ButtonViewModel) {
        self.discountButton.setTitle(viewModel.title, for: .normal)
        self.viewModel = viewModel
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
            discountButton
        ])
    }
}

// MARK: - Layout
private extension ButtonMessageTableViewCell {
    func setConstraints() {
        NSLayoutConstraint.activate([
            discountButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            discountButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            discountButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            discountButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            discountButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}

// MARK: - Action
private extension ButtonMessageTableViewCell {
    @objc func tupDiscountButton() {
        viewModel?.didTap()
    }
}
