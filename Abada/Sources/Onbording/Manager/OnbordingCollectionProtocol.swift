import UIKit

// MARK: - OnbordingCollectionProtocol
protocol OnbordingCollectionProtocol {
    func setup(collectionView: UICollectionView)
    func update(viewModel: [OnbordingViewModel])
    func delegate(delegate: OnbordingInput)
}
