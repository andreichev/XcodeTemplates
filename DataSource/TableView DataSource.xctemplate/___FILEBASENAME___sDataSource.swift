// ___FILEHEADER___

import SharedBusinessLogic

protocol ___VARIABLE_entityName___sDataSourceDelegate: AnyObject {}

final class ___VARIABLE_entityName___sDataSource: NSObject {

    // MARK: - Properties

    private var data: [___VARIABLE_entityName___] = []
    private var tableView: UITableView
    weak var delegate: ___VARIABLE_entityName___sDataSourceDelegate?

    // MARK: - Init

    init(data: [___VARIABLE_entityName___] = [], tableView: UITableView) {
        self.tableView = tableView
        self.data = data
        super.init()
        tableView.register(
            ___VARIABLE_entityName___Cell.self,
            forCellReuseIdentifier: ___VARIABLE_entityName___Cell.identifier
        )
        tableView.dataSource = self
        tableView.delegate = self
    }

    // MARK: - Internal methods

    func updateData(_ data: [___VARIABLE_entityName___]) {
        self.data = data
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource

extension ___VARIABLE_entityName___sDataSource: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: ___VARIABLE_entityName___Cell.identifier,
            for: indexPath
        ) as? ___VARIABLE_entityName___Cell
        let item = data[indexPath.row]
        cell?.configure(with: item)
        return cell ?? UITableViewCell()
    }
}

// MARK: - UITableViewDelegate

extension ___VARIABLE_entityName___sDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // openItemAction in delegate
    }
}
