import UIKit
import AbadaUI

// MARK: - DetailServiceButtonCell
final class DetailServiceButtonCell: UITableViewCell {

    private var viewModel: DetailButtonViewModel?

    private lazy var button: BigButtonUI = {
        let button = BigButtonUI(title: "")
        button.addTarget(self, action: #selector(pressedButton), for: .touchUpInside)
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func fill(viewModel: DetailButtonViewModel) {
        self.button.setTitle(viewModel.title, for: .normal)
        self.viewModel = viewModel
    }
}

// MARK: - Setting
private extension DetailServiceButtonCell {
    func setupView() {
        selectionStyle = .none
        backgroundColor = AbadaColors.Color(resource: .abadaBackground)
        addSubView()
        setConstraints()
    }
}

// MARK: - Setting
private extension DetailServiceButtonCell {
    func addSubView() {
        contentView.addSubviews([
            button
        ])
    }
}

// MARK: - Setting
private extension DetailServiceButtonCell {
    func setConstraints() {
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            button.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            button.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20)
        ])
    }
}

// MARK: - Action
private extension DetailServiceButtonCell {
    @objc
    func pressedButton() {
        viewModel?.didTup()
    }
}
