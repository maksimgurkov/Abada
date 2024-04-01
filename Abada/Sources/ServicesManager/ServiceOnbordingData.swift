import Foundation

// MARK: - OnbordingModel
struct OnbordingModels {
    let onbordings: [OnbordingModel]
}

struct OnbordingModel {
    let image: String
    let title: String
}

struct OnbordingData {
    static let shared = OnbordingData()

    let onbording = OnbordingModels(onbordings: [
        OnbordingModel(image: "house", title: "Добро пожаловать в наше приложение для ремонта и благоустройства квартир, домов и нежилых помещений"),
        OnbordingModel(image: "abada", title: "Здесь вы познакомитесь с нашей компанией, сможете выбрать подходящую для Вас услугу и связаться с нами любым удоным способом."),
        OnbordingModel(image: "phone", title: "Мы с удовольствие отсветим на все вопрос, и отправим специалиста для точного замера и оформления договра."),
        OnbordingModel(image: "discount", title: "Так же в нашем приложении, Вы сможете получить персональную скидку. Готовы приступить к переменам? Давайте воплощать идеи в жизнь!")
    ]
    )
}
