import UserNotifications

final class Notification {
    func checkForPermisson() {
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.getNotificationSettings { settings in
            switch settings.authorizationStatus {
            case .authorized:
                self.dispatchNotification()
            case .denied:
                return
            case .notDetermined:
                notificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) { didAllow, _ in
                    if didAllow {
                        self.dispatchNotification()
                    }
                }
            default:
                return
            }
        }
    }

    private func dispatchNotification() {
        let identifier = "New"
        let title = "ABADA"
        let bode = "Загляни в приложение прямо сейчас, Вам доступна персональная скидка"
        let hour = 11
        let minute = 00
        let isDaily = true

        let notification = UNUserNotificationCenter.current()

        let content = UNMutableNotificationContent()
        content.title = title
        content.body = bode
        content.sound = .default

        let calendar = Calendar.current
        var dateComponents = DateComponents(calendar: calendar, timeZone: TimeZone.current)
        dateComponents.hour = hour
        dateComponents.minute = minute

        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: isDaily)
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)

        notification.removePendingNotificationRequests(withIdentifiers: [identifier])
        notification.add(request)
    }
}
