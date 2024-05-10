import UIKit
import AbadaUI

// MARK: - DetailServiceTitleCell
final class DetailServiceTitleCell: UITableViewCell {

    private var viewModel: DetailTitleViewModel?

    // MARK: - Private properties
    lazy var titleLabel = TitleLabelUI(text: "")

    private lazy var favoriteButton: TransparentButtonUI = {
        let button = TransparentButtonUI(systemName: "")
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

    func fill(viewModel: DetailTitleViewModel) {
        self.titleLabel.text = viewModel.text
        self.favoriteButton.setImage(UIImage(systemName: viewModel.systemName), for: .normal)
        self.viewModel = viewModel
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
            titleLabel,
            favoriteButton
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
            titleLabel.rightAnchor.constraint(equalTo: favoriteButton.leftAnchor, constant: -20),

            favoriteButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            favoriteButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            favoriteButton.heightAnchor.constraint(equalToConstant: 20),
            favoriteButton.widthAnchor.constraint(equalToConstant: 20)
        ])
    }
}

// MARK: - Action
private extension DetailServiceTitleCell {
    @objc
    func pressedButton() {
        viewModel?.didTap()
    }
}
