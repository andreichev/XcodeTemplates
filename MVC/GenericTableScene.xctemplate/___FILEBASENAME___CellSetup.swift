//___FILEHEADER___

import SharedBusinessLogic
import SharedComponents

public protocol ___VARIABLE_sceneName___CellSetupDelegate: AnyObject {
    func reloadAction()
}

public final class ___VARIABLE_sceneName___CellSetup {
    private var entity: ___VARIABLE_entityName___?
    public var messageAboutError: String = .empty
    public weak var delegate: ___VARIABLE_sceneName___CellSetupDelegate?

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

    func errorCell(_ cell: ErrorCell, for indexPath: IndexPath) {
        cell.configure(with: messageAboutError)
        cell.delegate = self
    }
}

// MARK: - Action handlers

extension ___VARIABLE_sceneName___CellSetup: ErrorCellDelegate {
    public func reloadData() {
        delegate?.reloadAction()
    }
}

