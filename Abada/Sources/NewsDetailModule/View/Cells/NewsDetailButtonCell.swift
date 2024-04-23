import UIKit
import AbadaUI

// MARK: - NewsDetailButtonCell
class NewsDetailButtonCell: UITableViewCell {

    // MARK: - Private properties
    private var viewModel: NewsButtonViewModel?
    private let detailButton: BigButtonUI = {
        let button = BigButtonUI(title: "")
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
    func fill(viewModel: NewsButtonViewModel) {
        self.viewModel = viewModel
        self.detailButton.setTitle(viewModel.title, for: .normal)
    }
}

// MARK: - SetupView
private extension NewsDetailButtonCell {
    func setupView() {
        selectionStyle = .none
        backgroundColor = AbadaColors.Color(resource: .abadaBackground)
        detailButton.addTarget(self, action: #selector(tupDetailButton), for: .touchUpInside)
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
            detailButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            detailButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
}

// MARK: - Actions
private extension NewsDetailButtonCell {
    @objc
    func tupDetailButton() {
        viewModel?.didTup()
    }
}
