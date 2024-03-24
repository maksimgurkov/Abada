import Foundation

enum MessageTypeCell {
    case bot(BotViewModel)
    case user(UserViewModel)
    case button(ButtonViewModel)
}

struct BotViewModel {
    let image: String
    let text: String
}

struct UserViewModel {
    let image: String
    let text: String
}

struct ButtonViewModel {
    let title: String
}
