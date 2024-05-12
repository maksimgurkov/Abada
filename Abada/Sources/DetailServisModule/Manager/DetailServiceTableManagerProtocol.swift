import UIKit

// MARK: - DetailServisInformationTableManagerProtocol
protocol DetailServiceTableManagerProtocol {
    func setup(tableView: UITableView)
    func update(viewModel: [DetailServiceTypeCell])
}
