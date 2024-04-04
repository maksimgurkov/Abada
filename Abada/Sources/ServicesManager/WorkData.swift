import Foundation

// swiftlint:disable line_length

struct WorkModel {
    let title: String
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

    let works = [
        WorkModel(
            title: "Дизайн квартир",
            descriptionWork: [
                DetailWorkModel(
                    title: "Планировочный этап",
                    image: "disaneApartment",
                    description: "Важный этап при ремонте, это планировочное решение. Разводка коммуникаций, электрика, сантехника, освещение, планируются на основе плана расстановки мебели. Для того, чтобы все розетки были в нужном месте, а не скрыты за мебелью.  Освещение должно освещать там, где оно больше всего необходимо.",
                    price: 2800
                ), DetailWorkModel(
                    title: "Дизайн-проект",
                    image: "1.2",
                    description: "Важный этап при ремонте, это планировочное решение. Разводка коммуникаций, электрика, сантехника, освещение, планируются на основе плана расстановки мебели. Для того, чтобы все розетки были в нужном месте, а не скрыты за мебелью.  Освещение должно освещать там, где оно больше всего необходимо.",
                    price: 2800
                ), DetailWorkModel(
                    title: "Авторский надзор",
                    image: "1.3",
                    description: "Важный этап при ремонте, это планировочное решение. Разводка коммуникаций, электрика, сантехника, освещение, планируются на основе плана расстановки мебели. Для того, чтобы все розетки были в нужном месте, а не скрыты за мебелью.  Освещение должно освещать там, где оно больше всего необходимо.",
                    price: 2800
                ), DetailWorkModel(
                    title: "3D-визуализация",
                    image: "disaneApartment",
                    description: "Важный этап при ремонте, это планировочное решение. Разводка коммуникаций, электрика, сантехника, освещение, планируются на основе плана расстановки мебели. Для того, чтобы все розетки были в нужном месте, а не скрыты за мебелью.  Освещение должно освещать там, где оно больше всего необходимо.",
                    price: 2800
                ), DetailWorkModel(
                    title: "Согласование перепланировки",
                    image: "disaneApartment",
                    description: "Важный этап при ремонте, это планировочное решение. Разводка коммуникаций, электрика, сантехника, освещение, планируются на основе плана расстановки мебели. Для того, чтобы все розетки были в нужном месте, а не скрыты за мебелью.  Освещение должно освещать там, где оно больше всего необходимо.",
                    price: 2800
                )]
        ), WorkModel(
            title: "Ремонт квартир",
            descriptionWork: [DetailWorkModel(
                title: "",
                image: "",
                description: "",
                price: 2888
            )]
        ), WorkModel(
            title: "Ванна под ключ",
            descriptionWork: [DetailWorkModel(
                title: "",
                image: "",
                description: "",
                price: 2888
            )]
        ), WorkModel(
            title: "Ремонт домов",
            descriptionWork: [DetailWorkModel(
                title: "",
                image: "",
                description: "",
                price: 2888
            )]
        ), WorkModel(
            title: "Натяжные потолки",
            descriptionWork: [DetailWorkModel(
                title: "",
                image: "",
                description: "",
                price: 2888
            )]
        ), WorkModel(
            title: "Мебель",
            descriptionWork: [DetailWorkModel(
                title: "",
                image: "",
                description: "",
                price: 2888
            )]
        ), WorkModel(
            title: "Окна",
            descriptionWork: [DetailWorkModel(
                title: "",
                image: "",
                description: "",
                price: 2888
            )]
        ), WorkModel(
            title: "Межкомнатные и входные двери",
            descriptionWork: [DetailWorkModel(
                title: "",
                image: "",
                description: "",
                price: 2888
            )]
        ), WorkModel(
            title: "Кондиционеры. Монтаж и обслуживание",
            descriptionWork: [DetailWorkModel(
                title: "",
                image: "",
                description: "",
                price: 2888
            )]
        ), WorkModel(
            title: "Сантехнические работы",
            descriptionWork: [DetailWorkModel(
                title: "",
                image: "",
                description: "",
                price: 2888
            )]
        ), WorkModel(
            title: "Видеонаблюдение",
            descriptionWork: [DetailWorkModel(
                title: "",
                image: "",
                description: "",
                price: 2888
            )]
        ), WorkModel(
            title: "Электромонтажные работы",
            descriptionWork: [DetailWorkModel(
                title: "",
                image: "",
                description: "",
                price: 2888
            )]
        ), WorkModel(
            title: "Коммерческие помещения",
            descriptionWork: [DetailWorkModel(
                title: "",
                image: "",
                description: "",
                price: 2888
            )]
        ), WorkModel(
            title: "Оформление окна",
            descriptionWork: [DetailWorkModel(
                title: "",
                image: "",
                description: "",
                price: 2888
            )]
        ), WorkModel(
            title: "Экраны для радиаторов отопления",
            descriptionWork: [DetailWorkModel(
                title: "",
                image: "",
                description: "",
                price: 2888
            )]
        )]
}
