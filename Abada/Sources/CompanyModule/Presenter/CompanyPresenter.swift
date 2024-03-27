import Foundation

// MARK: - CompanyPresenter
final class CompanyPresenter {
    weak var view: CompanyInput?

    // MARK: - Private properties
    private let tableManager: CompanyTableManagerProtocol
    private let viewModels = CompanyData.shared.company

    init(tableView: CompanyTableManagerProtocol) {
        self.tableManager = tableView
    }
}

// MARK: - CompanyPresenterProtocol
extension CompanyPresenter: CompanyPresenterProtocol {
    func viewDidLoad() {
        view?.viewTitle("О нас")
        createViewModel(viewModel: viewModels)
    }
}

// MARK: - Setting
private extension CompanyPresenter {
    func createViewModel(viewModel: CompanyModel) {
        var viewModels = [CompanyTypeCell]()
        var certificates = [CertificatViewModel]()
        var partners = [PartnerViewModel]()

        let companyViewModel: CompanyTypeCell = .companyCell(
            .init(
                title: viewModel.title,
                description: viewModel.description,
                image: viewModel.image
            )
        )
        viewModels.append(companyViewModel)

        let headerCertificate: CompanyTypeCell = .collectionHeader(.init(title: "Лицензии"))
        viewModels.append(headerCertificate)

        viewModel.certificates.forEach {
            let certificat = CertificatViewModel(
                title: $0.title,
                subTitle: $0.subTitle,
                image: $0.image
            )
            certificates.append(certificat)
        }
        let certificatViewModel: CompanyTypeCell = .collectionCertificateCell(.init(certificates: certificates))
        viewModels.append(certificatViewModel)
        certificates = []

        let headerPartner: CompanyTypeCell = .collectionHeader(.init(title: "Партнёры"))
        viewModels.append(headerPartner)

        viewModel.pertners.forEach {
            let partner = PartnerViewModel(
                title: $0.title,
                image: $0.image
            )
            partners.append(partner)
        }
        let partnerViewModel: CompanyTypeCell = .collectionPartnerCell(.init(partners: partners))
        viewModels.append(partnerViewModel)

        let requisites: CompanyTypeCell = .collectionHeader(.init(title: "Реквизиты"))
        viewModels.append(requisites)

        DispatchQueue.main.async {
            self.tableManager.update(viewModels: viewModels)
        }
    }
}
