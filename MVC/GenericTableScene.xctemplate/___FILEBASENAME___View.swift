//___FILEHEADER___

import MDFoundation
import SharedBusinessLogic
import SharedComponents
import Storable

final class ___VARIABLE_sceneName___View: UIView {
    // MARK: - Properties

    public var tableView: UITableView = {
        let tableView = UITableView(frame: UIScreen.main.bounds)
        tableView.tableFooterView = UIView()
        tableView.allowsSelection = false
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableView.automaticDimension
        tableView.showsVerticalScrollIndicator = false
        tableView.contentInset = tableView.contentInset.with(bottom: 50)
        return tableView
    }()

    public var tableBuilder: ___VARIABLE_sceneName___TableBuilder?

    // MARK: - Init

    override init(frame: CGRect = UIScreen.main.bounds) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder : NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        setupStyle()
        addSubviews()
        makeConstraints()
        initData()
    }

    private func setupStyle() {
        tableView.backgroundColor = Assets.background1.color
    }

    private func addSubviews() {
        addSubview(tableView)
    }

    private func makeConstraints() {
        tableView.makeEdgesEqualToSuperview()
    }

    private func initData(with entity: ___VARIABLE_entityName___? = nil) {
        tableBuilder = ___VARIABLE_sceneName___TableBuilder(
            tableView: tableView,
            entity: entity
        )
    }

    // MARK: - Public methods

    public func updateAppearance(with entity: ___VARIABLE_entityName___, animated: Bool = true) {
        tableBuilder?.update___VARIABLE_entityName___(entity, animated: animated)
    }

    func showError(message: String) {
        tableBuilder?.messageAboutError = message
        tableBuilder?.showError()
    }
}
