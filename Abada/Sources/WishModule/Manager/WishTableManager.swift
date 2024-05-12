import UIKit

// MARK: - WishTableManager
final class WishTableManager: NSObject {

    // MARK: - Properties
    weak var tableView: UITableView?

    // MARK: - Private properties
    private var viewModels = [DetailServisViewModel]()
}

// MARK: - WishTableManagerProtocol
extension WishTableManager: WishTableManagerProtocol {

    func setup(tableView: UITableView) {
        self.tableView = tableView
        self.tableView?.register(
            GroupServisTableViewCell.self,
            forCellReuseIdentifier: GroupServisTableViewCell.description()
        )
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
        self.tableView?.separatorStyle = .none
        self.tableView?.backgroundColor = AbadaColors.Color(resource: .abadaBackground)
    }

    func update(viewModels: [DetailServisViewModel]) {
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
            withIdentifier: GroupServisTableViewCell.description(),
            for: indexPath
        ) as? GroupServisTableViewCell else { return UITableViewCell() }
        cell.fill(viewModel: viewModel)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension WishTableManager: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewModel = viewModels[indexPath.row]
        viewModel.didTup(viewModel)
    }
}
