//___FILEHEADER___

import SharedBusinessLogic
import SharedComponents

public final class ___VARIABLE_sceneName___TableBuilder {
    public typealias Row = GenericTableViewRowModel

    // MARK: - Properties

    private var genericDataSource: GenericTableViewDataSource
    // swiftlint:disable weak_delegate
    private var genericTableViewDelegate: GenericTableViewDelegate?
    private var dataStorage: GenericTableViewDataStorage = GenericTableViewDataStorage()
    private var tableView: UITableView
    private var cellsSetup: ___VARIABLE_sceneName___CellSetup

    // MARK: - Init

    public init(tableView: UITableView, entity: ___VARIABLE_entityName___?) {
        self.tableView = tableView
        self.genericDataSource = GenericTableViewDataSource(with: dataStorage)
        self.genericTableViewDelegate = GenericTableViewDelegate(with: dataStorage)
        tableView.dataSource = genericDataSource
        tableView.delegate = genericTableViewDelegate
        self.cellsSetup = ___VARIABLE_sceneName___CellSetup(entity: entity, tableView: tableView)
        buildMinimalTableStructure()
    }

    // MARK: - Public methods

    public func update___VARIABLE_entityName___(_ entity: ___VARIABLE_entityName___, animated: Bool) {
        cellsSetup.update___VARIABLE_entityName___(entity)
        buildFullTableStructure()
        reloadData(animated: animated)
    }

    public func reloadData(animated: Bool) {
        if animated {
            let range = NSRange(location: 0, length: tableView.numberOfSections)
            let sections = NSIndexSet(indexesIn: range)
            tableView.reloadSections(sections as IndexSet, with: .fade)
        } else {
            tableView.reloadData()
        }
    }

    // MARK: - Private methods

    func buildMinimalTableStructure() {
        let rowsSequence: [Row] = [
            Row(LoadingCell.loadingCell(_:for:)),
        ]
        setRowsSequenceToDataStorage(rowsSequence: rowsSequence)
    }

    func buildFullTableStructure() {
        let rowsSequence: [Row] = [
            Row(cellsSetup.someCell(_:for:)),
            Row(cellsSetup.otherCell(_:for:))
        ]
        setRowsSequenceToDataStorage(rowsSequence: rowsSequence)
    }

    func setRowsSequenceToDataStorage(rowsSequence: [GenericTableViewRowModel]) {
        let section = GenericTableViewSectionModel(with: rowsSequence)
        dataStorage.update(withOneSection: section)
        dataStorage.registerFor(tableView)
    }
}
