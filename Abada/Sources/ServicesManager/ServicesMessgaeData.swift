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
                text: "Привет! Я твой помошник. Чем могу тебе помочь?"
            ),
            userOne: User(
                image: "avatar_user",
                text: "Хочу получить персональную скидку. Как это сделать?"
            ),
            botTwo: Bot(
                image: "avatar_bot",
                text: "Всё просто, нужно нажать на кнопку внизу экрана «Получить купон». Покажи этот купон менеджеру по замеру, и он предоставит персональную скидку."
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
