import UIKit

// MARK: - GroupTableManager
final class GroupTableManager: NSObject {
    weak var tableView: UITableView?

    // MARK: - Private properties
    private var viewModel = [GroupViewModel]()
}

// MARK: - GroupTableManagerProtocol
extension GroupTableManager: GroupTableManagerProtocol {
    func setup(tableView: UITableView) {
        self.tableView = tableView
        self.tableView?.register(
            GroupWorkTableViewCell.self,
            forCellReuseIdentifier: GroupWorkTableViewCell.description()
        )
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
        self.tableView?.showsVerticalScrollIndicator = false
        self.tableView?.separatorStyle = .none
    }

    func update(viewModel: [GroupViewModel]) {
        self.viewModel = viewModel
        self.tableView?.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension GroupTableManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = viewModel[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: GroupWorkTableViewCell.description(),
            for: indexPath
        ) as? GroupWorkTableViewCell else { return UITableViewCell() }
        cell.fill(viewModel: viewModel)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension GroupTableManager: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewModel = viewModel[indexPath.row]
        viewModel.didTup(viewModel)
    }
}
