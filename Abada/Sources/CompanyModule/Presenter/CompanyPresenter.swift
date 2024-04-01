import UIKit

// MARK: - CompanyPresenter
final class CompanyPresenter {
    weak var view: CompanyInput?

    // MARK: - Private properties
    private let tableManager: CompanyTableManagerProtocol
    private let viewModels = CompanyData.shared.company
    private let router: ApplicationRouterProtocol

    init(tableView: CompanyTableManagerProtocol, router: ApplicationRouterProtocol) {
        self.tableManager = tableView
        self.router = router
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
        var requisitesViewModel = [RequisitesViewModel]()

        let companyViewModel: CompanyTypeCell = .companyCell(
            .init(
                title: viewModel.title,
                description: viewModel.description,
                image: viewModel.image
            )
        )
        viewModels.append(companyViewModel)

        let headerCertificate: CompanyTypeCell = .headerCell(.init(title: "Лицензии"))
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

        let headerPartner: CompanyTypeCell = .headerCell(.init(title: "Партнёры"))
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

        let requisites: CompanyTypeCell = .headerCell(.init(title: "Реквизиты"))
        viewModels.append(requisites)

        viewModel.requisites.forEach {
            let requisitesModel = RequisitesViewModel(
                title: $0.title,
                description: $0.description
            )
            requisitesViewModel.append(requisitesModel)
        }
        let model: CompanyTypeCell = .collectionRequisitesCell(.init(requisites: requisitesViewModel))
        viewModels.append(model)

        let applicationButton: CompanyTypeCell = .applicationButtonCell(.init(title: "Оставить заявку", didTup: {
            self.router.routerToApplication()
        }))
        viewModels.append(applicationButton)

        let phoneButton: CompanyTypeCell = .applicationButtonCell(.init(title: "Позвонить", didTup: {
            if let url = URL(string: "tel://89261356825") {
                UIApplication.shared.open(url)
            }
        }))
        viewModels.append(phoneButton)

        DispatchQueue.main.async {
            self.tableManager.update(viewModels: viewModels)
        }
    }
}
