import Foundation

// MARK: - DetailServisViewModel
struct DetailServisViewModel {
    let image: String
    let title: String
    let detailArticle: String
    let price: String
    let didTup: (DetailServisViewModel) -> Void
}
