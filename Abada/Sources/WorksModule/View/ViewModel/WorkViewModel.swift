import Foundation

struct WorkViewModel {
    let title: String
    let image: String
    let descriptionWork: [DetailWorkViewModel]
}

struct DetailWorkViewModel {
    let title: String
    let image: String
    let description: String
    let price: Int
}
