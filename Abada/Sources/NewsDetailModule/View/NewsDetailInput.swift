import Foundation

// MARK: - NewsDetailInput
protocol NewsDetailInput: AnyObject {
    func updateView(viewModel: DetailViewModel)
}
