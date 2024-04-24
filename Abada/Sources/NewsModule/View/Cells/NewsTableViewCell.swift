import UIKit
import AbadaUI

// MARK: - NewsTableViewCell
final class NewsTableViewCell: UITableViewCell {

    // MARK: - Private properties
    private let newsImage = PhotoBorderImageViewUI(image: "")

    private let newsTitle: TitleLabelUI = {
        let label = TitleLabelUI(text: "")
        label.textColor = #colorLiteral(red: 0.3190954328, green: 0.3190953732, blue: 0.3190953732, alpha: 1)
        return label
    }()

    private let containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.backgroundColor = .white
        view.alpha = 0.6
        return view
    }()

    // MARK: - Initialisers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func fill(viewModel: NewsViewModel) {
        self.newsImage.image = UIImage(named: viewModel.image)
        self.newsTitle.text = viewModel.title
    }
}

// MARK: - SetupView
private extension NewsTableViewCell {
    func setupView() {
        selectionStyle = .none
        backgroundColor = AbadaColors.Color(resource: .abadaBackground)
        addSubView()
        setConstraints()
    }
}

// MARK: - Setting
private extension NewsTableViewCell {
    func addSubView() {
        contentView.addSubviews([newsImage, containerView, newsTitle])
    }
}

// MARK: - Layout
private extension NewsTableViewCell {
    func setConstraints() {
        NSLayoutConstraint.activate([
            newsImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            newsImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            newsImage.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            newsImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),

            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            containerView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),

            newsTitle.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            newsTitle.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 10),
            newsTitle.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -10),
            newsTitle.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10)
        ])
    }
}
