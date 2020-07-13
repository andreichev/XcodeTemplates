//___FILEHEADER___

import SharedComponents
import BusinessLogic

protocol ___VARIABLE_sceneName___CellSetupDelegate: AnyObject {
    func reloadAction()
}

final class ___VARIABLE_sceneName___CellSetup {
    private var entity: ___VARIABLE_entityName___?
    var messageAboutError: String = .empty
    weak var delegate: ___VARIABLE_sceneName___CellSetupDelegate?

    private var tableView: UITableView

    // MARK: - Init

    init(entity: ___VARIABLE_entityName___?, tableView: UITableView) {
        self.entity = entity
        self.tableView = tableView
    }

    // MARK: - Internal methods

    func update___VARIABLE_entityName___(_ entity: ___VARIABLE_entityName___) {
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

    func errorCell(_ cell: ErrorCell, for indexPath: IndexPath) {
        cell.configure(with: messageAboutError)
        cell.delegate = self
    }
}

// MARK: - Action handlers

extension ___VARIABLE_sceneName___CellSetup: ErrorCellDelegate {
    func reloadData() {
        delegate?.reloadAction()
    }
}

