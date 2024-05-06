import UIKit

// MARK: - PersonDiscountPresenterProtocol
protocol PersonDiscountPresenterProtocol {
    func viewDidLoad()
    /// Получение рандомного персонального купона
    ///
    /// Проверка идёт по текущему месяцу и месяцу в моделе
    func getRandomCoupon() -> PersonDiscountModel

    func readDataFromUserDefaults(discountLabel: UILabel, descriptionLabel: UILabel, couponLabel: UILabel, periodLabel: UILabel)
}
