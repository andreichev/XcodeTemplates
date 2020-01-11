//___FILEHEADER___

import SharedBusinessLogic
import SharedComponents

public final class ___VARIABLE_sceneName___CellSetup {
    private var entity: ___VARIABLE_entityName___?

    private var tableView: UITableView

    // MARK: - Init

    public init(entity: ___VARIABLE_entityName___?, tableView: UITableView) {
        self.entity = entity
        self.tableView = tableView
    }

    // MARK: - Public methods

    public func update___VARIABLE_entityName___(_ entity: ___VARIABLE_entityName___) {
        self.entity = entity
    }

    // MARK: - Cells setup

    func someCell(_ cell: UITableViewCell, for indexPath: IndexPath) {
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = "Some cell"
    }

    func otherCell(_ cell: UITableViewCell, for indexPath: IndexPath) {
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = "Other cell"
    }
}
