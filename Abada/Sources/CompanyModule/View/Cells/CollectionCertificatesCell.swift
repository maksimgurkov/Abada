import UIKit

// MARK: - CertificateCell
final class CollectionCertificatesCell: UITableViewCell {

    private var viewModels: CertificatViewModels?
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

    func fill(viewModels: CertificatViewModels) {
        self.viewModels = viewModels
    }
}

// MARK: - SetupView
private extension CollectionCertificatesCell {
    func setupView() {
        addSubView()
        setConstraints()

        collectionView.dataSource = self
        collectionView.delegate = self

        collectionView.register(CertificateCell.self, forCellWithReuseIdentifier: CertificateCell.description())

        setupLayout()
    }
}

// MARK: - Setting
private extension CollectionCertificatesCell {
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
private extension CollectionCertificatesCell {
    func setConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}

// MARK: - UICollectionViewDataSource
extension CollectionCertificatesCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModels?.certificates.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let viewModel = viewModels?.certificates[indexPath.item]

        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CertificateCell.description(),
            for: indexPath
        ) as? CertificateCell else { return UICollectionViewCell() }
        cell.fill(
            image: viewModel?.image ?? "",
            title: viewModel?.title ?? "",
            description: viewModel?.subTitle ?? ""
        )
        return cell
    }

}

// MARK: - UICollectionViewDelegate
extension CollectionCertificatesCell: UICollectionViewDelegate {

}

// MARK: - UICollectionViewDelegateFlowLayout
extension CollectionCertificatesCell: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        CGSize(width: contentView.frame.width, height: 500)
    }
}
