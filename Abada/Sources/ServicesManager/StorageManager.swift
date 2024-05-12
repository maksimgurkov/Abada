import RealmSwift
// swiftlint:disable force_try

final class StorageManager {
    static let shared = StorageManager()

    let realm = try! Realm()

    private init() {}

    func save(_ servis: WishViewModelRealm) {
        write {
            realm.add(servis)
        }
    }

    func delete(_ servis: WishViewModelRealm) {
        write {
            realm.delete(servis)
        }
    }

    private func write(completion: () -> Void) {
        do {
            try realm.write {
                completion()
            }
        } catch {
            print(error)
        }
    }
}
