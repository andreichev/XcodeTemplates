// ___FILEHEADER___

import SharedBusinessLogic

final class ___VARIABLE_entityName___sDataSource: NSObject {
    private var data: [___VARIABLE_entityName___]?
    private var tableView: UITableView
    var openItemAction: (() -> Void)?

    init(data: [___VARIABLE_entityName___]? = nil, tableView: UITableView) {
        self.tableView = tableView
        self.data = data
        super.init()
        tableView.register(___VARIABLE_entityName___Cell.self,
                           forCellReuseIdentifier: ___VARIABLE_entityName___Cell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
    }

    func update___VARIABLE_entityName___s(_ data: [___VARIABLE_entityName___]) {
        self.data = data
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource

extension OffersDataSource: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return data?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ___VARIABLE_entityName___Cell.identifier,
            for: indexPath
        ) as? ___VARIABLE_entityName___Cell else {
            return ___VARIABLE_entityName___Cell()
        }
        if let item = data?[indexPath.row] {
            cell.configure(with: item)
        }
        return cell
    }
}

// MARK: - UITableViewDelegate

extension ___VARIABLE_entityName___sDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        openItemAction?()
    }
}
