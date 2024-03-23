import UIKit

// MARK: - NewsTableManagerProtocol
protocol NewsTableManagerProtocol {
    func setup(tableView: UITableView)
    func update(viewModels: [NewsViewModel])
}
