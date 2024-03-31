import Foundation

// MARK: - OnbordingPresenter
final class OnbordingPresenter {
    weak var view: OnbordingInput?

    private let router: OnbordingRouterProtocol
    private let collectionManager: OnbordingCollectionProtocol

    init(router: OnbordingRouterProtocol, collectionManager: OnbordingCollectionProtocol) {
        self.router = router
        self.collectionManager = collectionManager
    }

}

// MARK: - OnbordingPresenterProtocol
extension OnbordingPresenter: OnbordingPresenterProtocol {
    func viewDidLoad() {
        DispatchQueue.main.async {
            self.collectionManager.update(viewModel: [1, 2, 3])
        }
    }

    func goToTabBar() {
        router.goToTabBar()
    }
}
