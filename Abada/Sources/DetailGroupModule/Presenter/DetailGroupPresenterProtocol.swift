import UIKit

// MARK: - DetailGroupPresenterProtocol
protocol DetailGroupPresenterProtocol {
    func viewDidLoad()
    func getTitle(_ title: UILabel)
    func getImage(_ imageView: UIImageView)
    func getDescriptionLabel(_ label: UILabel)
    func getPriceLabel(_ label: UILabel)
}
