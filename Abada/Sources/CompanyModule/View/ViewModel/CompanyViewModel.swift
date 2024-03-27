import Foundation

enum CompanyTypeCell {
    case companyCell(CompanyViewModel)
    case headerCell(CertificatHeaderViewModel)
    case collectionCertificateCell(CertificatViewModels)
    case collectionPartnerCell(PartnerViewModels)
    case collectionRequisitesCell(RequisitesViewModels)
    case applicationButtonCell(NewsButtonViewModel)
}

// MARK: - CompanyViewModel
struct CompanyViewModel {
    let title: String
    let description: String
    let image: String
}

struct CertificatHeaderViewModel {
    let title: String
}

struct CertificatViewModels {
    let certificates: [CertificatViewModel]
}

struct CertificatViewModel {
    let title: String
    let subTitle: String
    let image: String
}

struct PartnerViewModels {
    let partners: [PartnerViewModel]
}

struct PartnerViewModel {
    let title: String
    let image: String
}

struct RequisitesViewModels {
    let requisites: [RequisitesViewModel]
}

struct RequisitesViewModel {
    let title: String
    let description: String
}
