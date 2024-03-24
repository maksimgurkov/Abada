import Foundation

// MARK: - NewsTypeCell
enum NewsTypeCell {
    case newsImage(NewsImageViewModel)
    case newsDescription(NewsDescriptionViewModel)
    case newsButton(NewsButtonViewModel)
}

// MARK: - NewsImageViewModel
struct NewsImageViewModel {
    let image: String
}

// MARK: - NewsDescriptionViewModel
struct NewsDescriptionViewModel {
    let description: String
}

// MARK: - NewsButtonViewModel
struct NewsButtonViewModel {
    let title: String
}
