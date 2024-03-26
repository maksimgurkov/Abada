import UIKit

// MARK: - CompanyTableManager
final class CompanyTableManager: NSObject {

    weak var tableView: UITableView?

    // MARK: - Private properties
    private var viewModels = [CompanyViewModel]()
}

// MARK: - ComanyTableManagerProtocol
extension CompanyTableManager: CompanyTableManagerProtocol {
    func setup(tableView: UITableView) {
        self.tableView = tableView
        tableView.separatorStyle = .none
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
        self.tableView?.register(CompanyTableViewCell.self, forCellReuseIdentifier: CompanyTableViewCell.description())
    }

    func update(viewModels: [CompanyViewModel]) {
        self.viewModels = viewModels
        self.tableView?.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension CompanyTableManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = viewModels[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CompanyTableViewCell.description(),
            for: indexPath
        ) as? CompanyTableViewCell else { return UITableViewCell() }
        cell.fill(viewModel: viewModel)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension CompanyTableManager: UITableViewDelegate {

}
