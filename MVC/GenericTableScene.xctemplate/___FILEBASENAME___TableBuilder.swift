//___FILEHEADER___

import SharedComponents
import BusinessLogic

final class ___VARIABLE_sceneName___TableBuilder {
    typealias Row = GenericTableViewRowModel

    // MARK: - Properties

    private var genericDataSource: GenericTableViewDataSource
    // swiftlint:disable weak_delegate
    private var genericTableViewDelegate: GenericTableViewDelegate?
    private var dataStorage: GenericTableViewDataStorage = GenericTableViewDataStorage()
    private var tableView: UITableView
    private var cellsSetup: ___VARIABLE_sceneName___CellSetup
    var entity: ___VARIABLE_entityName___?

        // Action handlers properties
    var delegate: ___VARIABLE_sceneName___CellSetupDelegate? {
        set {
            cellsSetup.delegate = newValue
        }
        get {
            return cellsSetup.delegate
        }
    }

    var messageAboutError: String {
        set {
            cellsSetup.messageAboutError = newValue
        }
        get {
            return cellsSetup.messageAboutError
        }
    }
    
    // MARK: - Init

    init(tableView: UITableView, entity: ___VARIABLE_entityName___?) {
        self.entity = entity
        self.tableView = tableView
        self.genericDataSource = GenericTableViewDataSource(with: dataStorage)
        self.genericTableViewDelegate = GenericTableViewDelegate(with: dataStorage)
        tableView.dataSource = genericDataSource
        tableView.delegate = genericTableViewDelegate
        self.cellsSetup = ___VARIABLE_sceneName___CellSetup(entity: entity, tableView: tableView)
        buildMinimalTableStructure()
    }

    // MARK: - Internal methods

    func showError() {
        buildErrorCellTableStructure()
        reloadData(animated: false)
    }

    func update___VARIABLE_entityName___(_ entity: ___VARIABLE_entityName___, animated: Bool) {
        cellsSetup.update___VARIABLE_entityName___(entity)
        buildFullTableStructure()
        reloadData(animated: animated)
    }

    func reloadData(animated: Bool) {
        if animated == false { tableView.reloadData(); return }
        if genericDataSource.numberOfSections(in: tableView) == tableView.numberOfSections {
            let range = NSRange(location: 0, length: tableView.numberOfSections)
            let sections = NSIndexSet(indexesIn: range)
            tableView.reloadSections(sections as IndexSet, with: .fade)
        } else {
            UIView.transition(
                with: tableView,
                duration: 0.3,
                options: .transitionCrossDissolve,
                animations: { [weak self] in
                    self?.tableView.reloadData()
                },
                completion: nil
            )
        }
    }

    // MARK: - Private methods

    private func buildErrorCellTableStructure() {
        let rowsSequence: [Row] = [
            Row(cellsSetup.errorCell(_:for:), fromNib: true),
        ]
        setRowsSequenceToDataStorage(rowsSequence: rowsSequence)
    }

    private func buildMinimalTableStructure() {
        let rowsSequence: [Row] = [
            Row(LoadingCell.loadingCell(_:for:)),
        ]
        setRowsSequenceToDataStorage(rowsSequence: rowsSequence)
    }

    private func buildFullTableStructure() {
        let rowsSequence: [Row] = [
            Row(cellsSetup.someCell(_:for:)),
            Row(cellsSetup.otherCell(_:for:))
        ]
        setRowsSequenceToDataStorage(rowsSequence: rowsSequence)
    }

    private func setRowsSequenceToDataStorage(rowsSequence: [GenericTableViewRowModel]) {
        let section = GenericTableViewSectionModel(with: rowsSequence)
        dataStorage.update(withOneSection: section)
        dataStorage.registerFor(tableView)
    }
}
