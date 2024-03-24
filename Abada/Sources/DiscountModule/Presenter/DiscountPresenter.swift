import Foundation

// MARK: - DiscountPresenter
final class DiscountPresenter {
    weak var view: DiscountInput?

    private let tableView: DiscountTableManagerProtocol
    private let viewModel = MessageData.shared.messages

    init(tableView: DiscountTableManagerProtocol) {
        self.tableView = tableView
    }
}

// MARK: - DiscountPresenterProtocol
extension DiscountPresenter: DiscountPresenterProtocol {
    func viewDidLoad() {
        createViewModel(viewModel: viewModel)
        view?.viewTitle("Скидки")
    }
}

// MARK: - DiscountPresenter
private extension DiscountPresenter {
    func createViewModel(viewModel: [MessageModel]) {
        var viewModels = [MessageTypeCell]()
        viewModel.forEach {
            let botOneModel: MessageTypeCell = .bot(.init(image: $0.botOne.image, text: $0.botOne.text))
            viewModels.append(botOneModel)
            let userOneModel: MessageTypeCell = .user(.init(image: $0.userOne.image, text: $0.userOne.text))
            viewModels.append(userOneModel)
            let botTwoModel: MessageTypeCell = .bot(.init(image: $0.botTwo.image, text: $0.botTwo.text))
            viewModels.append(botTwoModel)
            let userTwoModel: MessageTypeCell = .user(.init(image: $0.userTwo.image, text: $0.userTwo.text))
            viewModels.append(userTwoModel)
            let botThreeModel: MessageTypeCell = .bot(.init(image: $0.botThree.image, text: $0.botThree.text))
            viewModels.append(botThreeModel)
            let buttonModel: MessageTypeCell = .button(.init(title: $0.button.title))
            viewModels.append(buttonModel)
        }
        DispatchQueue.main.async {
            self.tableView.update(viewModels: viewModels)
        }
    }
}
