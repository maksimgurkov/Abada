import UIKit
import AbadaUI

// MARK: - NewsDetailButtonCell
final class NewsDetailButtonCell: UITableViewCell {

    // MARK: - Private properties
    private let detailButton: BigButtonUI = {
        let button = BigButtonUI()
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

    // MARK: - Public functions
    func fill(title: String) {
        self.detailButton.setTitle(title, for: .normal)
    }
}

// MARK: - SetupView
private extension NewsDetailButtonCell {
    func setupView() {
        selectionStyle = .none
        addSubView()
        setConstraints()
    }
}

// MARK: - Setting
private extension NewsDetailButtonCell {
    func addSubView() {
        contentView.addSubviews([detailButton])
    }
}

// MARK: - Layout
private extension NewsDetailButtonCell {
    func setConstraints() {
        NSLayoutConstraint.activate([
            detailButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            detailButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            detailButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20)
        ])
    }
}
