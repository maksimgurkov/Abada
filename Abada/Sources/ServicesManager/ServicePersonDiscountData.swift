import Foundation

struct PersonDiscountModel {
    let discount: String
    let description: String
    let coupon: String
    let period: String
}

struct PersonDiscountData {
    static let shared = PersonDiscountData()

    let discount = [
        PersonDiscountModel(
            discount: "1000₽",
            description: "Скидка на обслуживание кондиционера",
            coupon: "Кондей-1000",
            period: "Действует с 01.05.2024 по 31.05.2024"
        ),
        PersonDiscountModel(
            discount: "5000₽",
            description: "На монтаж радиаторов",
            coupon: "АБАДА-МАЙ",
            period: "Действует с 01.05.2024 по 31.05.2024"
        ),
        PersonDiscountModel(
            discount: "3000₽",
            description: "Замена дверной коробки",
            coupon: "ДВЕРЬ-3000",
            period: "Действует с 01.05.2024 по 31.05.2024"
        )
    ]
}
