import UIKit

// MARK: - NewsDetailTableManagerProtocol
protocol NewsDetailTableManagerProtocol {
    func setup(tableView: UITableView)
    func update(viewModels: [NewsTypeCell])
}
