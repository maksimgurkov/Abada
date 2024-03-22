import Foundation

// MARK: - Container
/// DI Контейнер
public final class Container {
    public static let shared = Container()

    public init() {}

    private var services: [String: Any] = [:]

    /// Метод регистрирует тип в контейнере.
    public func register<Service>(service: Service.Type, resolver: @escaping (Container) -> Service) {
        let key = "\(type(of: Service.self))"
        self.services[key] = resolver(self)
    }

    /// Метод достает из контейнера объект по типу.
    public func resolve<Service>() -> Service {
        let key = "\(type(of: Service.self))"
        guard let service = services[key] as? Service else {
            fatalError("\(key) service not registered")
        }
        return service
    }
}
