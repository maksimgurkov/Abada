import Foundation
import AbadaDI

// MARK: - OnbordingAssembly
final class OnbordingAssembly: Assembly {
    func assemble() {
        Container.shared.register(service: OnbordingRouter.self) { _ in
            OnbordingRouter()
        }

        Container.shared.register(service: OnbordingCollectionManager.self) { _ in
            OnbordingCollectionManager()
        }

        Container.shared.register(service: OnbordingPresenter.self) { resolve in
            let router: OnbordingRouter = resolve.resolve()
            let collectionManager: OnbordingCollectionManager = resolve.resolve()
            return OnbordingPresenter(router: router, collectionManager: collectionManager)
        }

        Container.shared.register(service: OnbordingViewController.self) { resolve in
            let presenter: OnbordingPresenter = resolve.resolve()
            return OnbordingViewController(presenter: presenter)
        }

        @Dependency var router: OnbordingRouter
        @Dependency var collectionManager: OnbordingCollectionManager
        @Dependency var presenter: OnbordingPresenter
        @Dependency var view: OnbordingViewController

        collectionManager.setup(collectionView: view.collectionView)
        collectionManager.delegate(delegate: view.self)
        router.view = view
        presenter.view = view
    }
}
