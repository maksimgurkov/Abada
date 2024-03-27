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
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
        self.tableView?.register(CompanyTableViewCell.self, forCellReuseIdentifier: CompanyTableViewCell.description())
        self.tableView?.register(CertificateHeaderCell.self, forCellReuseIdentifier: CertificateHeaderCell.description())
        self.tableView?.register(CollectionCertificatesCell.self, forCellReuseIdentifier: CollectionCertificatesCell.description())
        self.tableView?.register(CollectionPartnersCell.self, forCellReuseIdentifier: CollectionPartnersCell.description())
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
        case .companyCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: CompanyTableViewCell.description(),
                for: indexPath
            ) as? CompanyTableViewCell else { return UITableViewCell() }
            cell.fill(viewModel: model)
            return cell

        case .collectionHeader(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: CertificateHeaderCell.description(),
                for: indexPath
            ) as? CertificateHeaderCell else { return UITableViewCell() }
            cell.fill(title: model.title)
            return cell

        case .collectionCertificateCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: CollectionCertificatesCell.description(),
                for: indexPath
            ) as? CollectionCertificatesCell else { return UITableViewCell() }
            cell.fill(viewModels: model)
            return cell

        case .collectionPartnerCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: CollectionPartnersCell.description(),
                for: indexPath
            ) as? CollectionPartnersCell else { return UITableViewCell() }
            cell.fill(viewModels: model)
            return cell
        }

    }
}

// MARK: - UITableViewDelegate
extension CompanyTableManager: UITableViewDelegate {
    //    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //        600
    //    }
}
