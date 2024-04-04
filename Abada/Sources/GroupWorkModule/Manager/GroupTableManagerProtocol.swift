import UIKit
// MARK: - GroupTableManagerProtocol
protocol GroupTableManagerProtocol {
    func setup(tableView: UITableView)
    func update(viewModel: [GroupViewModel])
}
