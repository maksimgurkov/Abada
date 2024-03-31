import UIKit

// MARK: - OnbordingCollectionProtocol
protocol OnbordingCollectionProtocol {
    func setup(collectionView: UICollectionView)
    func update(viewModel: [Int])
    func delegate(delegate: OnbordingInput)
}
