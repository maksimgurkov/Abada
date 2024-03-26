import Foundation

// swiftlint:disable line_length

struct WorkModel {
    let title: String
    let image: String
    let descriptionWork: [DetailWorkModel]
}

struct DetailWorkModel {
    let title: String
    let image: String
    let description: String
    let price: Int
}

struct WorkData {
    static var shared = WorkData()

    let works = [WorkModel(
        title: "Дизайн квартир",
        image: "disaneApartment",
        descriptionWork: [DetailWorkModel(
            title: "Планировочный этап",
            image: "disaneApartment",
            description: "Важный этап при ремонте, это планировочное решение. Разводка коммуникаций, электрика, сантехника, освещение, планируются на основе плана расстановки мебели. Для того, чтобы все розетки были в нужном месте, а не скрыты за мебелью.  Освещение должно освещать там, где оно больше всего необходимо.",
            price: 2800
        )]
    )]
}
