import Foundation

// MARK: - OnbordingPresenter
final class OnbordingPresenter {
    weak var view: OnbordingInput?

    private let router: OnbordingRouterProtocol
    private let collectionManager: OnbordingCollectionProtocol
    private let viewModels = OnbordingData.shared.onbording

    init(router: OnbordingRouterProtocol, collectionManager: OnbordingCollectionProtocol) {
        self.router = router
        self.collectionManager = collectionManager
    }

}

// MARK: - OnbordingPresenterProtocol
extension OnbordingPresenter: OnbordingPresenterProtocol {
    func viewDidLoad() {
        createViewModel(viewModel: viewModels)
    }

    func goToTabBar() {
        router.goToTabBar()
    }
}

// MARK: - OnbordingPresenter
private extension OnbordingPresenter {
    func createViewModel(viewModel: OnbordingModels) {
        var viewModels = [OnbordingViewModel]()
        viewModel.onbordings.forEach {
            let viewModel = OnbordingViewModel(image: $0.image, title: $0.title)
            viewModels.append(viewModel)
        }

        DispatchQueue.main.async {
            self.collectionManager.update(viewModel: viewModels)
        }
    }
}
