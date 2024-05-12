import UIKit
// MARK: - GroupTableManagerProtocol
protocol GroupServisTableManagerProtocol {
    func setup(tableView: UITableView)
    func update(viewModel: [DetailServisViewModel])
}
