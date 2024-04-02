import UIKit

// MARK: - GroupWorkViewController
final class GroupWorkViewController: UIViewController {
    
    // MARK: - Private properties
    private let presenter: GroupWorkPresenterProtocol
    
    // MARK: - Init
    init(presenter: GroupWorkPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public functions
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter.viewDidLoad()
    }
}

extension GroupWorkViewController: GroupWorkInput {
    func viewTitle(_ title: String) {
        self.title = title
    }
}

// MARK: - SetupView
private extension GroupWorkViewController {
    func setupView() {
        view.backgroundColor = .systemBackground
        addSubView()
        setConstraints()
    }
}

// MARK: - Setting
private extension GroupWorkViewController {
    func addSubView() {
        
    }
}

// MARK: - Layout
private extension GroupWorkViewController {
    func setConstraints() {
        NSLayoutConstraint.activate([
            
        ])
    }
}
