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
        tableView.estimatedRowHeight = 200
        tableView.showsVerticalScrollIndicator = false
        tableView.contentInset = tableView.contentInset.with(bottom: 80)
        return tableView
    }()

    public var dataSource: ___VARIABLE_sceneName___TableBuilder?

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
        tableView.backgroundColor = Assets.background2.color
    }

    private func addSubviews() {
        addSubview(tableView)
    }

    private func makeConstraints() {
        tableView.makeEdgesEqualToSuperview()
    }

    private func initData(with entity: ___VARIABLE_entityName___? = nil) {
        dataSource = ___VARIABLE_sceneName___TableBuilder(
            tableView: tableView,
            entity: entity
        )
    }

    // MARK: - Public methods

    public func updateAppearance(with entity: ___VARIABLE_entityName___, animated: Bool = true) {
        dataSource?.update___VARIABLE_entityName___(entity, animated: animated)
    }

    public func showEmptyPage() {
        dataSource?.update___VARIABLE_entityName___(___VARIABLE_entityName___(id: "1"), animated: true)
    }
}
