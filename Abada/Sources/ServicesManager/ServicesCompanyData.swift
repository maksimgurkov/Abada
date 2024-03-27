import Foundation
// swiftlint:disable line_length

// MARK: - CompanyModel
struct CompanyModel {
    let title: String
    let description: String
    let image: String
    let certificates: [CertificatModel]
    let pertners: [PartnerModel]
}

struct CertificatModel {
    let title: String
    let subTitle: String
    let image: String
}

struct PartnerModel {
    let title: String
    let image: String
}

struct CompanyData {
    static let shared = CompanyData()

    let company =
        CompanyModel(
            title: "Бренд Компания Абада создан в 2004 году, и за время работы по праву заслужила звание Лучшей Компании по ремонту и обустройству квартир.",
            description: """
Абада – мифический персонаж, встречающийся в эпосе культур народов мира, по облику напоминающий небольшого конька с рожками. Упоминания и черты абады прослеживаются в культуре народов Европы и Африки, знаменитой русской иконе XV века «Святой Власий и пустынные звери». Абада явилась прообразом знаменитого Конька-горбунка из сказки Ершова. Характерные черты абады: добродушие, преданность и трудолюбие. Название компании выбрано не случайно – именно эти качества заложили создатели бренда Компания Абада в своё детище.

В компании сформировался удобный и эффективный сервис, позволяющий клиентам снять с себя заботы по обустройству квартиры и повышению комфорта проживания. Многочисленные проблемы и временные затраты: поездки по строительным рынкам и торговым центрам, доставка стройматериалов, трудности с подбором необходимых комплектующих, согласованиями с УК – всё это осталось в прошлом. Компания Абада впервые внедрила европейскую технологию обслуживания квартир, обеспечивая полный спектр услуг: от выбора дизайна до вывоза строительного мусора.
""",
            image: "companyDetail_onas",
            certificates: [
                CertificatModel(
                    title: "Свидетельство СРО",
                    subTitle: "Свидетельство о допуске к определенному виду или видам работ, которые оказывают влияние на безопасность объектов капитального строительства.",
                    image: "svidetelstvo"
                ),
                CertificatModel(
                    title: "Диплом",
                    subTitle: "Диплом «Строительный Олимп»",
                    image: "diplom"
                ),
                CertificatModel(
                    title: "Сертификат ISO",
                    subTitle: "Сертификат соответствия требованиям ГОСТ ISO 9001-2011",
                    image: "certificatISO"
                ),
                CertificatModel(
                    title: "Лицензия",
                    subTitle: "Наша компания имеет все необходимые лицензионные разрешения на проводимые работы.",
                    image: "license"
                ),
                CertificatModel(
                    title: "Свидетельство",
                    subTitle: "О допуске к работам по строительству, реконструкции, капитальному ремонту",
                    image: "svidetelstvo1"
                ),
                CertificatModel(
                    title: "Лицензия",
                    subTitle: "Наша компания имеет все необходимые лицензионные разрешения на проводимые работы.",
                    image: "license1"
                )
            ],
            pertners: [
                PartnerModel(
                    title: "AQUATON",
                    image: "AQUATON"
                ),
                PartnerModel(
                    title: "GROHE",
                    image: "GROHE"
                ),
                PartnerModel(
                    title: "RMS",
                    image: "RMS"
                ),
                PartnerModel(
                    title: "Rossinka",
                    image: "Rossinka"
                ),
                PartnerModel(
                    title: "LEMARK",
                    image: "LEMARK"
                ),
                PartnerModel(
                    title: "HOPTA",
                    image: "HOPTA"
                )
            ]
        )
}
