import UIKit
import RealmSwift
// swiftlint:disable force_try

// MARK: - WishTableManager
final class WishTableManager: NSObject {

    // MARK: - Properties
    let realm = try! Realm()
    weak var tableView: UITableView?

    // MARK: - Private properties
    var viewModels: Results<WishViewModelRealm>!
}

// MARK: - WishTableManagerProtocol
extension WishTableManager: WishTableManagerProtocol {

    func setup(tableView: UITableView) {
        self.tableView = tableView
        self.tableView?.register(
            GroupWorkTableViewCell.self,
            forCellReuseIdentifier: GroupWorkTableViewCell.description()
        )
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
        self.tableView?.separatorStyle = .none
        self.tableView?.backgroundColor = AbadaColors.Color(resource: .abadaBackground)
        self.viewModels = realm.objects(WishViewModelRealm.self)
    }

    func update() {
        self.viewModels = realm.objects(WishViewModelRealm.self)
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
            withIdentifier: GroupWorkTableViewCell.description(),
            for: indexPath
        ) as? GroupWorkTableViewCell else { return UITableViewCell() }
        cell.fill(viewModel: viewModel)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension WishTableManager: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
