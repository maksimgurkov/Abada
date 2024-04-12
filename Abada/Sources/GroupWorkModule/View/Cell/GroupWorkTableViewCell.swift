import UIKit

// MARK: - GroupWorkTableViewCell
final class GroupWorkTableViewCell: UITableViewCell {

    // MARK: - Private properties
    private let imageWork: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 8
        image.layer.masksToBounds = true
        return image
    }()

    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray3
        view.layer.cornerRadius = 8
        return view
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        //        label.textColor = .black
        return label
    }()

    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func fill(viewModel: GroupViewModel) {
        self.imageWork.image = UIImage(named: viewModel.image)
        self.titleLabel.text = viewModel.title
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
        contentView.addSubviews([containerView, imageWork, titleLabel])
    }
}

// MARK: - Layout
private extension GroupWorkTableViewCell {
    func setConstraints() {
        NSLayoutConstraint.activate([
            imageWork.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            imageWork.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            imageWork.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            imageWork.heightAnchor.constraint(equalToConstant: 150),

            containerView.topAnchor.constraint(equalTo: imageWork.bottomAnchor, constant: -20),
            containerView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            containerView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),

            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 30),
            titleLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 20),
            titleLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -20),
            titleLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10)

        ])
    }
}
