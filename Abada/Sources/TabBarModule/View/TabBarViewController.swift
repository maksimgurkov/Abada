import UIKit
import AbadaDI

// MARK: - TabBarViewController
final class TabBarViewController: UITabBarController {

    // MARK: - Private properties
    private let presenter: TabBarPresenterProtocol

    // MARK: - Initialisers
    init(presenter: TabBarPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Override functions
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter.viewDidLoad()
    }
}

// MARK: - TabBarInput
extension TabBarViewController: TabBarInput { }

// MARK: - SetupView
private extension TabBarViewController {
    func setupView() {
        view.backgroundColor = .systemBackground
        tabBar.tintColor = #colorLiteral(red: 0.6082915664, green: 0.3423695564, blue: 0.268579036, alpha: 1)
        generatorTabBar()
    }
}

// MARK: - Setting
private extension TabBarViewController {
    func generator(viewController: UIViewController, title: String, image: UIImage?) -> UINavigationController {
        let item = UITabBarItem(title: title, image: image, tag: 0)
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem = item
        return navigationController
    }

    func generatorTabBar() {
        @Dependency var newsModule: NewsViewController
        @Dependency var workModule: WorkViewController
        @Dependency var companyModule: CompanyViewController
        @Dependency var discountModule: DiscountViewController
        self.viewControllers = [
            generator(viewController: newsModule, title: "Новости", image: UIImage(systemName: "newspaper")),
            generator(viewController: workModule, title: "Услуги", image: UIImage(systemName: "hammer")),
            generator(viewController: companyModule, title: "О нас", image: UIImage(systemName: "house")),
            generator(viewController: discountModule, title: "Скидка", image: UIImage(systemName: "tag"))
        ]
    }
}
