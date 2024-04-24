import UIKit
import AbadaUI

// MARK: - DetailServicePriceCell
final class DetailServicePriceCell: UITableViewCell {

    // MARK: - Private properties
    lazy var priceLabel: HeaderLabelUI = {
        let label = HeaderLabelUI(text: "")
        label.textColor = AbadaColors.Color(resource: .abadaAcent)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func fill(viewModel: DetailPriceViewModel) {
        self.priceLabel.text = "\(viewModel.amount)₽ м² по полу"
    }
}

// MARK: - SetupView
private extension DetailServicePriceCell {
    func setupView() {
        selectionStyle = .none
        backgroundColor = AbadaColors.Color(resource: .abadaBackground)
        addSubView()
        setConstraints()
    }
}

// MARK: - Setting
private extension DetailServicePriceCell {
    func addSubView() {
        contentView.addSubviews([
            priceLabel
        ])
    }
}

// MARK: - Layout
private extension DetailServicePriceCell {
    func setConstraints() {
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            priceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            priceLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            priceLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20)
        ])
    }
}
