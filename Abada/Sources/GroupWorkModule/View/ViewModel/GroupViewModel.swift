import Foundation

// MARK: - GroupViewModel
struct GroupViewModel {
    let image: String
    let title: String
    let description: String
    let price: Int
    let didTup: (GroupViewModel) -> Void
}
