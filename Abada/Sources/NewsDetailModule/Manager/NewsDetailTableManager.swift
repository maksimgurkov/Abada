import UIKit

// MARK: - NewsDetailTableManager
final class NewsDetailTableManager: NSObject {

    weak var tableview: UITableView?

    // MARK: - Private properties
    private var viewModels = [NewsTypeCell]()
}

// MARK: - NewsDetailTableManagerProtocol
extension NewsDetailTableManager: NewsDetailTableManagerProtocol {
    func setup(tableView: UITableView) {
        self.tableview = tableView
        self.tableview?.register(NewsDetailImageCell.self, forCellReuseIdentifier: NewsDetailImageCell.description())
        self.tableview?.register(NewsDescriptionCell.self, forCellReuseIdentifier: NewsDescriptionCell.description())
        self.tableview?.register(NewsDetailButtonCell.self, forCellReuseIdentifier: NewsDetailButtonCell.description())
        self.tableview?.dataSource = self
        self.tableview?.delegate = self
        self.tableview?.separatorStyle = .none
    }

    func update(viewModels: [NewsTypeCell]) {
        self.viewModels = viewModels
        self.tableview?.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension NewsDetailTableManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = viewModels[indexPath.row]
        switch viewModel {
        case .newsImage(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: NewsDetailImageCell.description(),
                for: indexPath
            ) as? NewsDetailImageCell else { return UITableViewCell() }
            cell.fill(image: model.image)
            return cell
        case .newsDescription(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: NewsDescriptionCell.description(),
                for: indexPath
            ) as? NewsDescriptionCell else { return UITableViewCell() }
            cell.fill(description: model.description)
            return cell
        case .newsButton(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: NewsDetailButtonCell.description(),
                for: indexPath
            ) as? NewsDetailButtonCell else { return UITableViewCell() }
            cell.fill(viewModel: model)
            return cell
        }
    }
}

// MARK: - UITableViewDelegate
extension NewsDetailTableManager: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let viewModel = viewModels[indexPath.row]
        switch viewModel {
        case .newsButton:
            return 60
        default:
            return UITableView.automaticDimension
        }
    }
}
