import UIKit

// MARK: - CertificateCell
final class CollectionPartnersCell: UITableViewCell {

    private var viewModels: PartnerViewModels?
    private let layout = UICollectionViewFlowLayout()

    private lazy var collectionView: UICollectionView = {
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()

    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func fill(viewModels: PartnerViewModels) {
        self.viewModels = viewModels
    }
}

// MARK: - SetupView
private extension CollectionPartnersCell {
    func setupView() {
        addSubView()
        setConstraints()

        collectionView.dataSource = self
        collectionView.delegate = self

        collectionView.register(PartnerCell.self, forCellWithReuseIdentifier: PartnerCell.description())

        setupLayout()
    }
}

// MARK: - Setting
private extension CollectionPartnersCell {
    func addSubView() {
        contentView.addSubviews([
            collectionView
        ])
    }

    func setupLayout() {
        layout.scrollDirection = .horizontal
    }
}

// MARK: - Layout
private extension CollectionPartnersCell {
    func setConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 120)
        ])
    }
}

// MARK: - UICollectionViewDataSource
extension CollectionPartnersCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModels?.partners.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let viewModel = viewModels?.partners[indexPath.item]

        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: PartnerCell.description(),
            for: indexPath
        ) as? PartnerCell else { return UICollectionViewCell() }
        cell.fill(
            image: viewModel?.image ?? "",
            title: viewModel?.title ?? ""
        )
        return cell
    }

}

// MARK: - UICollectionViewDelegate
extension CollectionPartnersCell: UICollectionViewDelegate {

}

// MARK: - UICollectionViewDelegateFlowLayout
extension CollectionPartnersCell: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        CGSize(width: contentView.frame.width / 3, height: 200)
    }
}
