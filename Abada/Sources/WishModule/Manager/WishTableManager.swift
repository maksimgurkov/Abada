import UIKit

// MARK: - WishTableManager
final class WishTableManager: NSObject {

    weak var tableView: UITableView?

    // MARK: - Private properties
    private var viewModels = ["10", "20", "30", "40", "50"]
}

// MARK: - WishTableManagerProtocol
extension WishTableManager: WishTableManagerProtocol {
    func setup(tableView: UITableView) {
        self.tableView = tableView
        self.tableView?.register(
            WishTableCell.self,
            forCellReuseIdentifier: WishTableCell.description()
        )
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
        self.tableView?.separatorStyle = .none
        self.tableView?.backgroundColor = AbadaColors.Color(resource: .abadaBackground)
    }

    func update(viewModels: [String]) {
        self.viewModels = viewModels
        self.tableView?.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension WishTableManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = viewModels[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: WishTableCell.description(),
            for: indexPath
        ) as? WishTableCell else { return UITableViewCell() }
        cell.fill(viewModel: viewModel)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension WishTableManager: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //        let viewModel = viewModels[indexPath.row]
        return UITableView.automaticDimension
    }
}
