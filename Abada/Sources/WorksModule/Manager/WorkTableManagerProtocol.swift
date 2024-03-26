import UIKit

// MARK: - PriceTableManagerProtocol
protocol WorkTableManagerProtocol {
    func setup(tableView: UITableView)
    func update(viewModel: [WorkViewModel])
}
