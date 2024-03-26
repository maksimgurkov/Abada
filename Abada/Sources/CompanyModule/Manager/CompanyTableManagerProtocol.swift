import UIKit

// MARK: - ComanyTableManagerProtocol
protocol CompanyTableManagerProtocol {
    func setup(tableView: UITableView)
    func update(viewModels: [CompanyViewModel])
}
