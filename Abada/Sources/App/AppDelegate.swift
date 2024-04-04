import UIKit
import AbadaDI

@main
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    var window: UIWindow?
    var notification = Notification()
    private var isOn = true
    private var userDefaults = UserDefaults.standard.bool(forKey: "false")

    func application(
        _ application: UIApplication,
        willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        RegisterAssembly.shared.registerAssembly()
        return true
    }

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        if !userDefaults {
            @Dependency var onbordingModule: OnbordingViewController

            window = UIWindow(frame: UIScreen.main.bounds)
            window?.rootViewController = onbordingModule
            window?.makeKeyAndVisible()
            UserDefaults.standard.set(isOn, forKey: "false")
        } else {
            @Dependency var tabBarModule: TabBarViewController

            window = UIWindow(frame: UIScreen.main.bounds)
            window?.rootViewController = tabBarModule
            window?.makeKeyAndVisible()
        }
        notification.checkForPermisson()
        return true
    }
}
