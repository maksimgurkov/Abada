import UIKit

final class DiscountTableManager: NSObject {

    weak var tableView: UITableView?
    private var viewModels = [Int]()
}

// MARK: - DiscountTableManagerProtocol
extension DiscountTableManager: DiscountTableManagerProtocol {

    func setup(tableView: UITableView) {
        self.tableView = tableView
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
        self.tableView?.register(ChatTableViewCell.self, forCellReuseIdentifier: ChatTableViewCell.id)
    }

    func update(viewModels: [Int]) {
        self.viewModels = viewModels
        self.tableView?.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension DiscountTableManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ChatTableViewCell.id,
            for: indexPath
        ) as? ChatTableViewCell else { return UITableViewCell() }
        cell.fill()
        return cell
    }

}

// MARK: - UITableViewDelegate
extension DiscountTableManager: UITableViewDelegate {

}
