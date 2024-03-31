import UIKit

// MARK: - CertificateCell
final class CertificatTableViewCell: UITableViewCell {

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
private extension CertificatTableViewCell {
    func setupView() {
        addSubView()
        setConstraints()

        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.bounces = false
        collectionView.dataSource = self
        collectionView.delegate = self

        collectionView.register(
            CertificatCollectionViewCell.self,
            forCellWithReuseIdentifier: CertificatCollectionViewCell.description()
        )

        setupLayout()
    }
}

// MARK: - Setting
private extension CertificatTableViewCell {
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
private extension CertificatTableViewCell {
    func setConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

// MARK: - UICollectionViewDataSource
extension CertificatTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModels?.certificates.count ?? 0
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {

        let viewModel = viewModels?.certificates[indexPath.item]

        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CertificatCollectionViewCell.description(),
            for: indexPath
        ) as? CertificatCollectionViewCell else { return UICollectionViewCell() }
        cell.fill(
            image: viewModel?.image ?? "",
            title: viewModel?.title ?? "",
            description: viewModel?.subTitle ?? ""
        )
        return cell
    }

}

// MARK: - UICollectionViewDelegate
extension CertificatTableViewCell: UICollectionViewDelegate {

}

// MARK: - UICollectionViewDelegateFlowLayout
extension CertificatTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        CGSize(width: collectionView.frame.width - 40, height: collectionView.frame.height)
    }
}
