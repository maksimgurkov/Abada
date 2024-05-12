import UIKit

// MARK: - DetailServisInformationTableManagerProtocol
protocol DetailServisTableManagerProtocol {
    func setup(tableView: UITableView)
    func update(viewModel: [DetailServisTypeCell])
}
