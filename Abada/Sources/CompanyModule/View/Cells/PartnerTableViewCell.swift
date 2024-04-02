import UIKit

// MARK: - CertificateCell
final class PartnerTableViewCell: UITableViewCell {

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
private extension PartnerTableViewCell {
    func setupView() {
        addSubView()
        setConstraints()

        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.bounces = false
        collectionView.dataSource = self
        collectionView.delegate = self

        collectionView.register(
            PartnerCollectionViewCell.self,
            forCellWithReuseIdentifier: PartnerCollectionViewCell.description()
        )

        setupLayout()
    }
}

// MARK: - Setting
private extension PartnerTableViewCell {
    func addSubView() {
        contentView.addSubviews([
            collectionView
        ])
    }

    func setupLayout() {
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        layout.minimumLineSpacing = 40
        layout.scrollDirection = .horizontal
    }
}

// MARK: - Layout
private extension PartnerTableViewCell {
    func setConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
}

// MARK: - UICollectionViewDataSource
extension PartnerTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModels?.partners.count ?? 0
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {

        let viewModel = viewModels?.partners[indexPath.item]

        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: PartnerCollectionViewCell.description(),
            for: indexPath
        ) as? PartnerCollectionViewCell else { return UICollectionViewCell() }
        cell.fill(
            image: viewModel?.image ?? "",
            title: viewModel?.title ?? ""
        )
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension PartnerTableViewCell: UICollectionViewDelegate {

}

// MARK: - UICollectionViewDelegateFlowLayout
extension PartnerTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        CGSize(width: collectionView.frame.width / 3 - 40, height: collectionView.frame.height)
    }
}
