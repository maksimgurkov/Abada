import UIKit

// MARK: - PersonDiscountPresenter
final class PersonDiscountPresenter {
    weak var view: PersonDiscountInput?

    // MARK: - Private properties
    private let viewModels = PersonDiscountData.shared.discount
}

// MARK: - PersonDiscountPresenterProtocol
extension PersonDiscountPresenter: PersonDiscountPresenterProtocol {
    func viewDidLoad() {
        // TODO: -
    }

    func updateData(discountLabel: UILabel, descriptionLabel: UILabel, couponLabel: UILabel, periodLabel: UILabel) {
        let choicePersonDiscount = viewModels.randomElement()

        let model = PersonDiscountViewModel(
            discount: choicePersonDiscount?.discount ?? "",
            description: choicePersonDiscount?.description ?? "",
            coupon: choicePersonDiscount?.coupon ?? "",
            period: choicePersonDiscount?.period  ?? ""
        )

        discountLabel.text = model.discount
        descriptionLabel.text = model.description
        couponLabel.text = model.coupon
        periodLabel.text = model.period
    }
}
