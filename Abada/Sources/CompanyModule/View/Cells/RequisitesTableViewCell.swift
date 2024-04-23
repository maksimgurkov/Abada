import UIKit

// MARK: - RequisitesTableViewCell
final class RequisitesTableViewCell: UITableViewCell {

    // MARK: Private propertyes
    private var viewModels: RequisitesViewModels?

    private let tableView: UITableView = {
        return UITableView(frame: .zero, style: .plain)
    }()

    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func fill(viewModels: RequisitesViewModels) {
        self.viewModels = viewModels
    }
}

// MARK: - SetupView
private extension RequisitesTableViewCell {
    func setupView() {
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = AbadaColors.Color(resource: .abadaBackground)
        tableView.register(
            DetailRequisitesTableViewCell.self,
            forCellReuseIdentifier: DetailRequisitesTableViewCell.description()
        )

        addSubView()
        setConstraints()
    }
}

// MARK: - Setting
private extension RequisitesTableViewCell {
    func addSubView() {
        contentView.addSubviews([
            tableView
        ])
    }
}

// MARK: - Layout
private extension RequisitesTableViewCell {
    func setConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: contentView.topAnchor),
            tableView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

// MARK: - UITableViewDataSource
extension RequisitesTableViewCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModels?.requisites.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = viewModels?.requisites[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: DetailRequisitesTableViewCell.description(),
            for: indexPath
        ) as? DetailRequisitesTableViewCell else {
            return UITableViewCell()
        }
        cell.fill(
            title: viewModel?.title ?? "",
            description: viewModel?.description ?? ""
        )
        return cell
    }
}

// MARK: - UITableViewDelegate
extension RequisitesTableViewCell: UITableViewDelegate {

}
