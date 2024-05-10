import Foundation

enum DetailTypeCell {
    case image(DetailImageViewModel)
    case title(DetailTitleViewModel)
    case article(DetailArticleViewModel)
    case price(DetailPriceViewModel)
    case button(DetailButtonViewModel)
}

struct DetailImageViewModel {
    let nameImage: String
}

struct DetailTitleViewModel {
    let text: String
    let systemName: String
    let didTap: () -> Void
}

struct DetailArticleViewModel {
    let text: String
}

struct DetailPriceViewModel {
    let amount: String
}

struct DetailButtonViewModel {
    let title: String?
    let didTap: () -> Void
}
