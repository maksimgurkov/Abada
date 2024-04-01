import UIKit
import AbadaUI

// MARK: - OnbordingViewController
final class OnbordingViewController: UIViewController {

    private let presenter: OnbordingPresenterProtocol
    private let layout = UICollectionViewFlowLayout()
    private var numberCell = 0

    lazy var collectionView: UICollectionView = {
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()

    private let pageController: UIPageControl = {
        let pageController = UIPageControl()
        pageController.currentPageIndicatorTintColor = #colorLiteral(red: 1, green: 0.8666666667, blue: 0.1764705882, alpha: 1)
        pageController.numberOfPages = 4
        return pageController
    }()

    private lazy var startButton: BigButtonUI = {
        let button = BigButtonUI(title: "Пропустить")
        button.addTarget(self, action: #selector(tupStartButton), for: .touchUpInside)
        return button
    }()

    // MARK: Initiliaze
    init(presenter: OnbordingPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        setupView()
    }
}

// MARK: - OnbordingInput
extension OnbordingViewController: OnbordingInput {
    func movementIndicator(position: Int) {
        pageController.currentPage = position / Int(view.bounds.width - 42)
        numberCell = position / Int(view.bounds.width - 42)
        switch numberCell {
        case 0, 1, 2:
            startButton.setTitle("Пропустить", for: .normal)
        default:
            startButton.setTitle("Начать", for: .normal)
        }
    }
}

// MARK: - SetupView
private extension OnbordingViewController {
    func setupView() {
        view.backgroundColor = .systemBackground
        addSubView()
        setupLayput()
        setConstraint()
    }
}

// MARK: - Setting
private extension OnbordingViewController {
    func addSubView() {
        view.addSubviews([
            collectionView,
            startButton,
            pageController
        ])
    }

    func setupLayput() {
        layout.minimumLineSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        layout.scrollDirection = .horizontal
    }
}

// MARK: - Layout
private extension OnbordingViewController {
    func setConstraint() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: pageController.topAnchor, constant: -20),

            pageController.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageController.bottomAnchor.constraint(equalTo: startButton.topAnchor, constant: -20),

            startButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            startButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            startButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        ])
    }
}

// MARK: - Action
private extension OnbordingViewController {
    @objc
    func tupStartButton() {
        presenter.goToTabBar()
    }
}
