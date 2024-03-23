import Foundation

// MARK: - NewsModel
struct NewsModel {
    let image: String
    let title: String
    let subTitle: String
}

struct NewsData {
    static let shared = NewsData()

    let news = [
        NewsModel(
            image: "disain",
            title: "Дизайн-проект в подарок",
            subTitle: "Закажи ремонт квартиры и получи дизайн-проект в подарок..."
        ),
        NewsModel(
            image: "disain",
            title: "Беспроцентная рассрочка",
            subTitle: "Ремонт квартиры в рассрочку без переплаты..."
        ),
        NewsModel(
            image: "disain",
            title: "Бесплатный расчет и замер",
            subTitle: "Рассчитаем стоимость ремонта и произведем необходимые замеры бесплатно."
        )
    ]
}
