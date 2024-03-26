import Foundation

// MARK: - NewsModel
struct MessageModel {
    let botOne: Bot
    let userOne: User
    let botTwo: Bot
    let userTwo: User
    let botThree: Bot
    let button: CouponButton
}

struct Bot {
    let image: String
    let text: String
}

struct User {
    let image: String
    let text: String
}

struct CouponButton {
    let title: String
}

struct MessageData {
    static let shared = MessageData()

    let messages = [
        MessageModel(
            botOne: Bot(
                image: "avatar_bot",
                text: "Приветствую! Я твой помошник. Чем могу тебе помочь?"
            ),
            userOne: User(
                image: "avatar_user",
                text: "Здравствуйте! Я хочу получить персональную скидку. Возможно ли это?"
            ),
            botTwo: Bot(
                image: "avatar_bot",
                text: """
Конечно, я могу помочь с этим!
Для получения персональной скидки вам нужно нажать на кнопку "Получить скидку" внизу экрана.
После этого система автоматически предоставит вам уникальный промокод.
"""
            ),
            userTwo: User(
                image: "avatar_user",
                text: "Спасибо, сейчас попробую!"
            ),
            botThree: Bot(
                image: "avatar_bot",
                text: "Персональная скидка обновляется каждый месяц. Я пришлю вам уведомление об этом."
            ),
            button: CouponButton(
                title: "Получить купон"
            )
        )
    ]

}
