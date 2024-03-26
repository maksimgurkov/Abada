import UIKit

// MARK: - DiscountTableManagerProtocol
protocol DiscountTableManagerProtocol {
    func setup(tableView: UITableView)
    func update(viewModels: [MessageTypeCell])
    func viewDidLoad()
}
