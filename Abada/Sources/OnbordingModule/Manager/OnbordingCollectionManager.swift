import UIKit

// MARK: - OnbordingCollectionManager
final class OnbordingCollectionManager: NSObject {
    weak var collectionView: UICollectionView?
    private var delegate: OnbordingInput?
    private var viewModel = [OnbordingViewModel]()
}

// MARK: - OnbordingCollectionProtocol
extension OnbordingCollectionManager: OnbordingCollectionProtocol {
    func setup(collectionView: UICollectionView) {
        self.collectionView = collectionView
        self.collectionView?.register(
            OnbordingCollectionCell.self,
            forCellWithReuseIdentifier: OnbordingCollectionCell.description()
        )
        self.collectionView?.dataSource = self
        self.collectionView?.delegate = self
        self.collectionView?.showsHorizontalScrollIndicator = false
        self.collectionView?.isPagingEnabled = true
        self.collectionView?.bounces = false
        self.collectionView?.backgroundColor = AbadaColors.Color(resource: .abadaBackground)
    }

    func update(viewModel: [OnbordingViewModel]) {
        self.viewModel = viewModel
        self.collectionView?.reloadData()
    }

    func delegate(delegate: OnbordingInput) {
        self.delegate = delegate
    }
}

// MARK: - UICollectionViewDataSource
extension OnbordingCollectionManager: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let viewModel = viewModel[indexPath.item]
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: OnbordingCollectionCell.description(),
            for: indexPath
        ) as? OnbordingCollectionCell else { return UICollectionViewCell() }
        cell.fill(viewModel: viewModel)
        return cell
    }

}

// MARK: - UICollectionViewDelegate
extension OnbordingCollectionManager: UICollectionViewDelegate {

}

// MARK: - UICollectionViewDelegateFlowLayout
extension OnbordingCollectionManager: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        CGSize(width: collectionView.frame.width - 10, height: collectionView.frame.height)
    }
}

// MARK: - UIScrollViewDelegate
extension OnbordingCollectionManager: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        delegate?.movementIndicator(position: Int(scrollView.contentOffset.x))
    }
}
