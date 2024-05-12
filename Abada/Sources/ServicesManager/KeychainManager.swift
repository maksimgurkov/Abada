import SwiftUI
import KeychainSwift

final class KeychainManager {
    static let shared = KeychainManager()

    private let keychain = KeychainSwift()
    private let token = "7019126549:AAHI3PPR2aefuWxF5yNI7jQCDm3JQQxIiZk"
    private let chatId = "-4198100751"

    private init() {
        saveToken(token)
        saveChatId(chatId)
    }

    func getToken() -> String? {
        return keychain.get("token")
    }

    func getChatId() -> String? {
        return keychain.get("chatId")
    }

    private func saveToken(_ token: String) {
        keychain.set(token, forKey: "token")
    }

    private func saveChatId(_ chatId: String) {
        keychain.set(chatId, forKey: "chatId")
    }
}
