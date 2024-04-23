import UIKit

// MARK: - DetailServisInformationTableManager
final class DetailServisTableManager: UITableView {
    weak var tableView: UITableView?

    // MARK: - Private properties
    private var viewModels = [DetailTypeCell]()
}

// MARK: - DetailServisInformationTableManagerProtocol
extension DetailServisTableManager: DetailServisTableManagerProtocol {
    func setup(tableView: UITableView) {
        self.tableView = tableView
        self.tableView?.showsVerticalScrollIndicator = false
        self.tableView?.backgroundColor = AbadaColors.Color(resource: .abadaBackground)
        self.tableView?.separatorStyle = .none
        self.tableView?.register(
            DetailServiceImageCell.self,
            forCellReuseIdentifier: DetailServiceImageCell.description()
        )
        self.tableView?.register(
            DetailServiceTitleCell.self,
            forCellReuseIdentifier: DetailServiceTitleCell.description()
        )
        self.tableView?.register(
            DetailServiceArticleCell.self,
            forCellReuseIdentifier: DetailServiceArticleCell.description()
        )
        self.tableView?.register(
            DetailServicePriceCell.self,
            forCellReuseIdentifier: DetailServicePriceCell.description()
        )
        self.tableView?.register(
            DetailServiceButtonCell.self,
            forCellReuseIdentifier: DetailServiceButtonCell.description()
        )
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
    }

    func update(viewModel: [DetailTypeCell]) {
        self.viewModels = viewModel
        self.tableView?.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension DetailServisTableManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = viewModels[indexPath.row]
        switch viewModel {
        case .image(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: DetailServiceImageCell.description(),
                for: indexPath
            ) as? DetailServiceImageCell else { return UITableViewCell() }
            cell.fill(viewModel: model)
            return cell

        case .title(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: DetailServiceTitleCell.description(),
                for: indexPath
            ) as? DetailServiceTitleCell else { return UITableViewCell() }
            cell.fill(viewModel: model)
            return cell

        case .article(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: DetailServiceArticleCell.description(),
                for: indexPath
            ) as? DetailServiceArticleCell else { return UITableViewCell() }
            cell.fill(viewModel: model)
            return cell

        case .price(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: DetailServicePriceCell.description(),
                for: indexPath
            ) as? DetailServicePriceCell else { return UITableViewCell() }
            cell.fill(viewModel: model)
            return cell

        case .button(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: DetailServiceButtonCell.description(),
                for: indexPath
            ) as? DetailServiceButtonCell else { return UITableViewCell() }
            cell.fill(viewModel: model)
            return cell
        }
    }
}

// MARK: - UITableViewDelegate
extension DetailServisTableManager: UITableViewDelegate {

}
