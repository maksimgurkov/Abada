import UIKit
import AbadaUI

// MARK: - GroupServisTableViewCell
final class GroupServisTableViewCell: UITableViewCell {

    // MARK: - Private properties
    private let imageWork = PhotoImageViewUI(image: "")

    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.cornerRadius = 8
        return view
    }()

    private let titleLabel: TitleLabelUI = {
        let label = TitleLabelUI(text: "")
        label.textColor = AbadaColors.Color(resource: .abadaText)
        return label
    }()

    private lazy var seporatorView: UIView = {
        let view = UIView()
        view.backgroundColor = AbadaColors.Color(resource: .abadaGray)
        return view
    }()

    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func fill(viewModel: DetailServisViewModel) {
        self.imageWork.image = UIImage(named: viewModel.image)
        self.titleLabel.text = viewModel.title
    }
}

// MARK: - SetupView
private extension GroupServisTableViewCell {
    func setupView() {
        selectionStyle = .none
        backgroundColor = .clear
        addSubView()
        setConstraints()
    }
}

// MARK: - Setting
private extension GroupServisTableViewCell {
    func addSubView() {
        contentView.addSubviews([containerView, imageWork, titleLabel, seporatorView])
    }
}

// MARK: - Layout
private extension GroupServisTableViewCell {
    func setConstraints() {
        NSLayoutConstraint.activate([
            imageWork.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            imageWork.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            imageWork.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            imageWork.heightAnchor.constraint(equalToConstant: 180),

            containerView.topAnchor.constraint(equalTo: imageWork.bottomAnchor, constant: -20),
            containerView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            containerView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),

            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 30),
            titleLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 0),
            titleLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -20),
            titleLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),

            seporatorView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            seporatorView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            seporatorView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            seporatorView.heightAnchor.constraint(equalToConstant: 0.5)
        ])
    }
}
