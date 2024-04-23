import UIKit

// MARK: - NewsTableManager
final class NewsTableManager: NSObject {

    weak var tableView: UITableView?

    // MARK: - Private properties
    private var viewModels = [NewsViewModel]()
}

// MARK: - NewsTableManagerProtocol
extension NewsTableManager: NewsTableManagerProtocol {
    func setup(tableView: UITableView) {
        self.tableView = tableView
        self.tableView?.register(
            NewsTableViewCell.self,
            forCellReuseIdentifier: NewsTableViewCell.description()
        )
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
        self.tableView?.separatorStyle = .none
    }

    func update(viewModels: [NewsViewModel]) {
        self.viewModels = viewModels
        self.tableView?.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension NewsTableManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = viewModels[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: NewsTableViewCell.description(),
            for: indexPath
        ) as? NewsTableViewCell else { return UITableViewCell() }
        cell.fill(viewModel: viewModel)
        return cell
    }
}

// MARK: - UITableViewDataSource
extension NewsTableManager: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewModel = viewModels[indexPath.row]
        viewModel.didTup(viewModel.detail)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }

}
