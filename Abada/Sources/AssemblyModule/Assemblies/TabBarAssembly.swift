import Foundation
import AbadaDI

// MARK: - TabBarAssembly
/// Класс реализует логику регистрации модуля TabBar в DI Container
final class TabBarAssembly: Assembly {
    func assemble() {
        Container.shared.register(service: TabBarPresenter.self) { _ in
            TabBarPresenter()
        }

        Container.shared.register(service: TabBarViewController.self) { resolve in
            let presenter: TabBarPresenter = resolve.resolve()
            return TabBarViewController(presenter: presenter)
        }

        @Dependency var presenter: TabBarPresenter
        @Dependency var view: TabBarViewController

        presenter.view = view

    }
}
