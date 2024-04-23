import UIKit

// MARK: - PriceTableManager
final class WorkTableManager: NSObject {
    weak var tableView: UITableView?

    // MARK: - Private properties
    private var viewModel = [WorkViewModel]()
}

// MARK: - PriceTableManagerProtocol
extension WorkTableManager: WorkTableManagerProtocol {
    func setup(tableView: UITableView) {
        self.tableView = tableView
        self.tableView?.register(WorkTableViewCell.self, forCellReuseIdentifier: WorkTableViewCell.description())
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
        self.tableView?.separatorStyle = .none
        self.tableView?.backgroundColor = AbadaColors.Color(resource: .abadaBackground)
    }

    func update(viewModel: [WorkViewModel]) {
        self.viewModel = viewModel
        self.tableView?.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension WorkTableManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = viewModel[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: WorkTableViewCell.description(),
            for: indexPath
        ) as? WorkTableViewCell else { return UITableViewCell() }
        cell.fill(viewModel: viewModel)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension WorkTableManager: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewModel = viewModel[indexPath.row]
        viewModel.didTup(viewModel.descriptionWork)
    }
}
