import UIKit

// MARK: - GroupServisTableManager
final class GroupServisTableManager: NSObject {
    weak var tableView: UITableView?

    // MARK: - Private properties
    private var viewModel = [DetailServisViewModel]()
}

// MARK: - GroupTableManagerProtocol
extension GroupServisTableManager: GroupServisTableManagerProtocol {
    func setup(tableView: UITableView) {
        self.tableView = tableView
        self.tableView?.showsVerticalScrollIndicator = false
        self.tableView?.separatorStyle = .none
        self.tableView?.backgroundColor = AbadaColors.Color(resource: .abadaBackground)
        self.tableView?.register(
            GroupServisTableViewCell.self,
            forCellReuseIdentifier: GroupServisTableViewCell.description()
        )
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
    }

    func update(viewModel: [DetailServisViewModel]) {
        self.viewModel = viewModel
        self.tableView?.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension GroupServisTableManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = viewModel[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: GroupServisTableViewCell.description(),
            for: indexPath
        ) as? GroupServisTableViewCell else { return UITableViewCell() }
        cell.fill(viewModel: viewModel)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension GroupServisTableManager: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewModel = viewModel[indexPath.row]
        viewModel.didTup(viewModel)
    }
}
