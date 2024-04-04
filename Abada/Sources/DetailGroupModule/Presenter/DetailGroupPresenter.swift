import UIKit

// MARK: - DetailGroupPresenter
final class DetailGroupPresenter {
    weak var view: DetailGroupInput?

    private let viewModel: GroupViewModel

    init(viewModel: GroupViewModel) {
        self.viewModel = viewModel
    }
}

// MARK: - DetailGroupPresenterProtocol
extension DetailGroupPresenter: DetailGroupPresenterProtocol {
    func viewDidLoad() {
        //
    }

    func getTitle(_ title: UILabel) {
        title.text = viewModel.title
    }

    func getImage(_ imageView: UIImageView) {
        imageView.image = UIImage(named: viewModel.image)
    }

    func getDescriptionLabel(_ label: UILabel) {
        label.text = viewModel.description
    }

    func getPriceLabel(_ label: UILabel) {
        label.text = "\(viewModel.price)₽ м² по полу"
    }
}
