import Foundation
import AbadaDI

// MARK: - RegisterAssembly
/// RegisterAssembly - запускает регистрацию в DI
final class RegisterAssembly {
    static let shared = RegisterAssembly()
    private let assemblies: [Assembly] = [
        NewsAssembly(),
        WorkAssembly(),
        CompanyAssembly(),
        DiscountAssembly(),
        PersonDiscountAssembly(),
        TabBarAssembly()
    ]

    func registerAssembly() {
        assemblies.forEach {
            $0.assemble()
        }
    }
}
