import Foundation

// MARK: - NewsViewModel
struct NewsViewModel {
    let image: String
    let title: String
    let detail: DetailViewModel
    let didTup: (DetailViewModel) -> Void
}

struct DetailViewModel {
    let title: String
    let image: String
    let description: String
}
