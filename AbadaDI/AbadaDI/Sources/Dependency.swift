import Foundation

// MARK: - Dependency

@propertyWrapper
/// Достает  контроллер из DI и собирает его по Типу
public class Dependency<T> {

    public var wrappedValue: T
    public init() {
        self.wrappedValue = Container.shared.resolve()
    }
}
