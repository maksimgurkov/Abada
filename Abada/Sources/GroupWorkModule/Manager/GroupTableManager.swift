import UIKit

// MARK: - GroupTableManager
final class GroupTableManager: NSObject {
    
    weak var tableView: UITableView?
    
    private var viewModel = [Int]()
}

// MARK: - GroupTableManagerProtocol
extension GroupTableManager: GroupTableManagerProtocol {
    func setup(tableView: UITableView) {
        self.tableView = tableView
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
    }
    
    func update(viewModel: [Int]) {
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
        return UITableViewCell()
    }
}

// MARK: - UITableViewDelegate
extension GroupTableManager: UITableViewDelegate {
    
}
