import UIKit
import RealmSwift
// swiftlint:disable force_try

// MARK: - DetailGroupPresenter
final class DetailGroupPresenter {

    let realm = try! Realm()
    weak var view: DetailGroupInput?

    private let viewModel: GroupViewModel
    private let tableManager: DetailServisTableManagerProtocol

    private let router: ApplicationRouterProtocol

    init(viewModel: GroupViewModel, tableView: DetailServisTableManagerProtocol, router: ApplicationRouterProtocol) {
        self.viewModel = viewModel
        self.tableManager = tableView
        self.router = router
    }
}

// MARK: - DetailGroupPresenterProtocol
extension DetailGroupPresenter: DetailGroupPresenterProtocol {

    func viewDidLoad() {
        createViewModel(viewModel: viewModel)
    }

    func getTitle(_ title: UILabel) {
        title.text = viewModel.title
    }
}

// MARK: - DetailGroupPresenter
private extension DetailGroupPresenter {
    func createViewModel(viewModel: GroupViewModel) {
        var viewModels = [DetailTypeCell]()

        let photoViewModel: DetailTypeCell = .image(.init(nameImage: viewModel.image))
        viewModels.append(photoViewModel)

        //        let titleViewModel: DetailTypeCell = .title(.init(
        //            text: viewModel.title,
        //            systemName: realm.objects(WishViewModelRealm.self).filter("title == %@", viewModel.title).isEmpty ? "heart" : "heart.fill",
        //            didTup: { [self] in
        //                let worksDataRealm = WishViewModelRealm()
        //                worksDataRealm.image = viewModel.image
        //                worksDataRealm.title = viewModel.title
        //                worksDataRealm.detailArticle = viewModel.description
        //                worksDataRealm.amount = viewModel.price
        //
        //
        //
        //                // Проверяем наличие объекта в Realm до его добавления
        //                if self.realm.objects(WishViewModelRealm.self).filter("title == %@", viewModel.title).isEmpty {
        //                    // Объект с таким названием отсутствует, добавляем
        //                    do {
        //                        try realm.write {
        //                            realm.add(worksDataRealm)
        //                            print("Данные успешно добавлены в Realm")
        //                        }
        //                    } catch { }
        //                } else {
        //                    if let existingObject = realm.objects(WishViewModelRealm.self).filter("title == %@", viewModel.title).first {
        //                        do {
        //                            try realm.write {
        //                                realm.delete(existingObject)
        //                                print("Данные удалены из Realm")
        //                            }
        //                        } catch { }
        //                    }
        //                }
        //            }))
        var systemName = realm.objects(WishViewModelRealm.self).filter("title == %@", viewModel.title).isEmpty ? "heart" : "heart.fill"

        let didTapAction: () -> Void = { [weak self] in
            guard let workModel = self else { return }

            let worksDataRealm = WishViewModelRealm()
            worksDataRealm.image = viewModel.image
            worksDataRealm.title = viewModel.title
            worksDataRealm.detailArticle = viewModel.description
            worksDataRealm.amount = viewModel.price

            let existingData = workModel.realm.objects(WishViewModelRealm.self).filter("title == %@", viewModel.title)

            do {
                try workModel.realm.write {
                    if existingData.isEmpty {
                        workModel.realm.add(worksDataRealm)
                        systemName = "plus"
                        print("Добавлено в Realm")
                    } else {
                        workModel.realm.delete(existingData)
                        systemName = "plus"
                        print("Удалено из Realm")
                    }
                }
            } catch { }
        }

        let titleViewModel: DetailTypeCell = .title(.init(
            text: viewModel.title,
            systemName: systemName,
            didTap: didTapAction
        ))
        viewModels.append(titleViewModel)

        let articleViewModel: DetailTypeCell = .article(.init(text: viewModel.description))
        viewModels.append(articleViewModel)

        let priceViewModel: DetailTypeCell = .price(.init(amount: viewModel.price))
        viewModels.append(priceViewModel)

        let requestViewModel: DetailTypeCell = .button(.init(title: "Подать заявку", didTap: {
            self.router.routerToApplication()
        }))
        viewModels.append(requestViewModel)

        let callViewModel: DetailTypeCell = .button(.init(title: "Позвонить", didTap: {
            if let url = URL(string: "tel://89261356825") {
                UIApplication.shared.open(url)
            }
        }))
        viewModels.append(callViewModel)

        DispatchQueue.main.async {
            self.tableManager.update(viewModel: viewModels)
        }
    }
}
