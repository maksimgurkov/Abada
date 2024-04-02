import UIKit

// MARK: - CompanyTableManager
final class CompanyTableManager: NSObject {

    weak var tableView: UITableView?

    // MARK: - Private properties
    private var viewModels = [CompanyTypeCell]()
}

// MARK: - ComanyTableManagerProtocol
extension CompanyTableManager: CompanyTableManagerProtocol {
    func setup(tableView: UITableView) {
        self.tableView = tableView
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
        self.tableView?.register(
            CompanyTableViewCell.self,
            forCellReuseIdentifier: CompanyTableViewCell.description()
        )
        self.tableView?.register(
            HeaderTableViewCell.self,
            forCellReuseIdentifier: HeaderTableViewCell.description()
        )
        self.tableView?.register(
            CertificatTableViewCell.self,
            forCellReuseIdentifier: CertificatTableViewCell.description()
        )
        self.tableView?.register(
            PartnerTableViewCell.self,
            forCellReuseIdentifier: PartnerTableViewCell.description()
        )
        self.tableView?.register(
            RequisitesTableViewCell.self,
            forCellReuseIdentifier: RequisitesTableViewCell.description()
        )
        self.tableView?.register(
            ApplicationButtonCell.self,
            forCellReuseIdentifier: ApplicationButtonCell.description()
        )
    }

    func update(viewModels: [CompanyTypeCell]) {
        self.viewModels = viewModels
        self.tableView?.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension CompanyTableManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = viewModels[indexPath.row]
        switch viewModel {

        // О компании
        case .companyCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: CompanyTableViewCell.description(),
                for: indexPath
            ) as? CompanyTableViewCell else { return UITableViewCell() }
            cell.fill(viewModel: model)
            return cell

        // Заголовок
        case .headerCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: HeaderTableViewCell.description(),
                for: indexPath
            ) as? HeaderTableViewCell else { return UITableViewCell() }
            cell.fill(title: model.title)
            return cell

        // Лицензии
        case .collectionCertificateCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: CertificatTableViewCell.description(),
                for: indexPath
            ) as? CertificatTableViewCell else { return UITableViewCell() }
            cell.fill(viewModels: model)
            return cell

        // Партнёры
        case .collectionPartnerCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: PartnerTableViewCell.description(),
                for: indexPath
            ) as? PartnerTableViewCell else { return UITableViewCell() }
            cell.fill(viewModels: model)
            return cell

        // Реквизиты
        case .collectionRequisitesCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: RequisitesTableViewCell.description(),
                for: indexPath
            ) as? RequisitesTableViewCell else { return UITableViewCell() }
            cell.fill(viewModels: model)
            return cell
        case .applicationButtonCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: ApplicationButtonCell.description(),
                for: indexPath
            ) as? ApplicationButtonCell else { return UITableViewCell() }
            cell.fill(viewModel: model)
            return cell
        case .phoneButtonCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: ApplicationButtonCell.description(),
                for: indexPath
            ) as? ApplicationButtonCell else { return UITableViewCell() }
            cell.fill(viewModel: model)
            return cell
        }
    }
}

// MARK: - UITableViewDelegate
extension CompanyTableManager: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let viewModel = viewModels[indexPath.row]
        switch viewModel {
        case .collectionCertificateCell:
            return 200
        case .collectionRequisitesCell:
            return 580
        case .collectionPartnerCell:
            return 80
        default:
            return UITableView.automaticDimension
        }
    }
}
