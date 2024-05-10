import Foundation
import RealmSwift

class WishViewModelRealm: Object {
    @Persisted var image: String = ""
    @Persisted var title: String = ""
    @Persisted var detailArticle: String = ""
    @Persisted var amount: String = ""
}
