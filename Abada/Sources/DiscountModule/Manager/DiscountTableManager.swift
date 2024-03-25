import UIKit

// MARK: - DiscountTableManager
final class DiscountTableManager: NSObject {
    weak var tableView: UITableView?

    // MARK: - Private properties
    private var viewModels = [MessageTypeCell]()
}

// MARK: - DiscountTableManagerProtocol
extension DiscountTableManager: DiscountTableManagerProtocol {
    func setup(tableView: UITableView) {
        self.tableView = tableView
        tableView.separatorStyle = .none
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
        self.tableView?.register(
            BotMessageTableViewCell.self,
            forCellReuseIdentifier: BotMessageTableViewCell.description()
        )
        self.tableView?.register(
            UserMessageTableViewCell.self,
            forCellReuseIdentifier: UserMessageTableViewCell.description()
        )
        self.tableView?.register(
            ButtonMessageTableViewCell.self,
            forCellReuseIdentifier: ButtonMessageTableViewCell.description()
        )
    }

    func update(viewModels: [MessageTypeCell]) {
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
        let viewModel = viewModels[indexPath.row]
        switch viewModel {
        case .bot(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: BotMessageTableViewCell.description(),
                for: indexPath
            ) as? BotMessageTableViewCell else { return UITableViewCell() }
            cell.fill(text: model.text, image: model.image)
            return cell
        case .user(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: UserMessageTableViewCell.description(),
                for: indexPath
            ) as? UserMessageTableViewCell else { return UITableViewCell() }
            cell.fill(text: model.text, image: model.image)
            return cell
        case .button(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: ButtonMessageTableViewCell.description(),
                for: indexPath
            ) as? ButtonMessageTableViewCell else { return UITableViewCell() }
            cell.fill(title: model.title)
            return cell
        }
    }
}

// MARK: - UITableViewDelegate
extension DiscountTableManager: UITableViewDelegate { }
