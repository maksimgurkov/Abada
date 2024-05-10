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
            WishTableCell.self,
            forCellReuseIdentifier: WishTableCell.description()
        )
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
        self.tableView?.separatorStyle = .none
        self.tableView?.backgroundColor = AbadaColors.Color(resource: .abadaBackground)

        //        print("в realm находится \(realm.objects(WishViewModelRealm.self).count)")
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
        return UITableView.automaticDimension
    }
}
