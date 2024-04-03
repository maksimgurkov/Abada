import UIKit

// MARK: - GroupWorkTableViewCell
final class GroupWorkTableViewCell: UITableViewCell {

    // MARK: - Private properties

    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - SetupView
private extension GroupWorkTableViewCell {
    func setupView() {
        selectionStyle = .none
        addSubView()
        setConstraints()
    }
}

// MARK: - Setting
private extension GroupWorkTableViewCell {
    func addSubView() {
        contentView.addSubviews([])
    }
}

// MARK: - Layout
private extension GroupWorkTableViewCell {
    func setConstraints() {
        NSLayoutConstraint.activate([

        ])
    }
}
