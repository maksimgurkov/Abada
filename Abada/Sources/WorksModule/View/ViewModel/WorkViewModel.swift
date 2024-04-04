import Foundation

struct WorkViewModel {
    let title: String
    let descriptionWork: WorkGroupViewModel
    let didTup: (WorkGroupViewModel) -> Void
}

struct WorkGroupViewModel {
    let nameGroup: String
    let groups: [DetailWorkViewModel]
}

struct DetailWorkViewModel {
    let title: String
    let image: String
    let description: String
    let price: Int
}
