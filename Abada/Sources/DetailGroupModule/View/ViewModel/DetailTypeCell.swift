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
}

struct DetailArticleViewModel {
    let text: String
}

struct DetailPriceViewModel {
    let amount: Int
}

struct DetailButtonViewModel {
    let title: String
    let didTup: () -> Void
}
