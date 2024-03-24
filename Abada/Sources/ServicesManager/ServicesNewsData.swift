import Foundation
// swiftlint:disable line_length

// MARK: - NewsModel
struct NewsModel {
    let image: String
    let title: String
    let subTitle: String
    let detail: DetailModel
}

struct DetailModel {
    let title: String
    let image: String
    let description: String
}

struct NewsData {
    static let shared = NewsData()

    let news = [
        NewsModel(
            image: AbadaAsset.disain.name,
            title: "Дизайн-проект в подарок",
            subTitle: "Закажи ремонт квартиры и получи дизайн-проект в подарок...",
            detail: DetailModel(
                title: "Дизайн квартир в Москве",
                image: "detailDizane",
                description: "Создание грамотного проекта планировки жилого или коммерческого помещения играет решающую роль в организации комфортных условий. Наши специалисты знают, как создать такой интерьер, в котором хотелось бы остаться, возвращаться в него и вдохновляться им. Дизайн-проект интерьера, составленный нашей командой архитекторов, дизайнеров и проектировщиков, позволяет грамотно разделить помещение на функциональные зоны, рационально расставить мебель, выполнить отделку каждого помещения наилучшим образом."
            )
        ),
        NewsModel(
            image: AbadaAsset.rassrochka.name,
            title: "Беспроцентная рассрочка",
            subTitle: "Ремонт квартиры в рассрочку без переплаты...",
            detail: DetailModel(
                title: "2",
                image: "",
                description: ""
            )
        ),
        NewsModel(
            image: AbadaAsset.person.name,
            title: "Бесплатный расчет и замер",
            subTitle: "Рассчитаем стоимость ремонта и произведем необходимые замеры бесплатно.",
            detail: DetailModel(
                title: "3",
                image: "",
                description: ""
            )
        )
    ]
}
