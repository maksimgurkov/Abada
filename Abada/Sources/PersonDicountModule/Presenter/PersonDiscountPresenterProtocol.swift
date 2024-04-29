import UIKit

// MARK: - PersonDiscountPresenterProtocol
protocol PersonDiscountPresenterProtocol {
    func viewDidLoad()
    func updateData(discountLabel: UILabel, descriptionLabel: UILabel, couponLabel: UILabel, periodLabel: UILabel)
}
