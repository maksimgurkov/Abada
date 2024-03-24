import UIKit

protocol DiscountTableManagerProtocol {
    func setup(tableView: UITableView)
    func update(viewModels: [MessageTypeCell])
    func viewDidLoad()
}
