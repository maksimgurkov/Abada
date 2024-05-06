import UIKit

// MARK: - PersonDiscountPresenter
final class PersonDiscountPresenter {
    weak var view: PersonDiscountInput?

    // MARK: - Private properties
    private var viewModels = PersonDiscountData.shared.discount
}

// MARK: - PersonDiscountPresenterProtocol
extension PersonDiscountPresenter: PersonDiscountPresenterProtocol {
    func viewDidLoad() {

    }

    func getRandomCoupon() -> PersonDiscountModel {
        guard let randomElement = viewModels.randomElement() else {
            fatalError("No element found")
        }

        let currentDate = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.month], from: currentDate)

        if Int(randomElement.month) == components.month {
            return randomElement
        } else {
            return getRandomCoupon()
        }
    }

    func saveToUserDefault(model: PersonDiscountModel) {
        let modelPersonDiscount: [String: String] = [
            "discount": model.discount,
            "description": model.description,
            "coupon": model.coupon,
            "period": model.period,
            "month": model.month
        ]

        UserDefaults.standard.set(modelPersonDiscount, forKey: "personDiscountModel")
        print("Данные в UserDefaults добавлены")
    }

    // Очищаем UserDefaults
    func clearUserDefaults() {
        UserDefaults.standard.removeObject(forKey: "personDiscountModel")
        print("Данные из UserDefaults успешно очищены.")
    }

    func updateUI(
        discountLabel: UILabel,
        descriptionLabel: UILabel,
        couponLabel: UILabel,
        periodLabel: UILabel,
        model: PersonDiscountModel
    ) {
        discountLabel.text = model.discount
        descriptionLabel.text = model.description
        couponLabel.text = model.coupon
        periodLabel.text = model.period
    }

    func readDataFromUserDefaults(
        discountLabel: UILabel,
        descriptionLabel: UILabel,
        couponLabel: UILabel,
        periodLabel: UILabel
    ) {
        if let modelPersonDiscount = UserDefaults.standard.dictionary(
            forKey: "personDiscountModel"
        ) {
            let model = PersonDiscountModel(
                discount: modelPersonDiscount["discount"] as? String ?? "",
                description: modelPersonDiscount["description"] as? String ?? "",
                coupon: modelPersonDiscount["coupon"] as? String ?? "",
                period: modelPersonDiscount["period"] as? String ?? "",
                month: modelPersonDiscount["month"] as? String ?? ""
            )

            let currentDate = Date()
            let calendar = Calendar.current
            let components = calendar.dateComponents([.month], from: currentDate)

            if components.month != Int(model.month) {
                clearUserDefaults()

                let newModel = getRandomCoupon()
                saveToUserDefault(model: newModel)
                updateUI(
                    discountLabel: discountLabel,
                    descriptionLabel: descriptionLabel,
                    couponLabel: couponLabel,
                    periodLabel: periodLabel,
                    model: newModel
                )
            } else {
                updateUI(
                    discountLabel: discountLabel,
                    descriptionLabel: descriptionLabel,
                    couponLabel: couponLabel,
                    periodLabel: periodLabel,
                    model: model
                )
                //                clearUserDefaults()
            }

        } else {
            let model = getRandomCoupon()
            saveToUserDefault(model: model)

            updateUI(
                discountLabel: discountLabel,
                descriptionLabel: descriptionLabel,
                couponLabel: couponLabel,
                periodLabel: periodLabel,
                model: model
            )
        }
    }
}
