// ___FILEHEADER___

import MDFoundation

final class ___VARIABLE_sceneName___View: UIView {
    // MARK: - Properties

    private(set) var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = Assets.background1.color
        tableView.refreshControl = UIRefreshControl()
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorInset = .zero
        tableView.estimatedRowHeight = 125
        tableView.contentInset.bottom = 100
        tableView.contentInsetAdjustmentBehavior = .always
        return tableView
    }()

    private var customDataSource: ___VARIABLE_entityName___sDataSource = .init()

    // MARK: - Init

    init() {
        super.init(frame: UIScreen.main.bounds)
        setupStyle()
        addSubviews()
        makeConstraints()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupStyle() {
        backgroundColor = Assets.background1.color
        customDataSource.setTableView(tableView)
    }

    private func addSubviews() {
        addSubview(tableView)
    }

    private func makeConstraints() {
        tableView.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide)
        }
    }

    // MARK: - Internal methods

    func setDelegate(_ delegate: ___VARIABLE_entityName___sDataSourceDelegate) {
        customDataSource.delegate = delegate
    }

    func endRefreshing() {
        tableView.refreshControl?.endRefreshing()
    }

    func showError(message: String) {
        customDataSource.errorMessage = message
        customDataSource.state = .error
        customDataSource.isLoadingNextPage = false
    }

    func showLoading() {
        customDataSource.state = .loading
    }

    func update___VARIABLE_entityName___s(_ data: [___VARIABLE_entityName___], nextPageNumber: Int?) {
        customDataSource.updateData(data, nextPageNumber: nextPageNumber)
    }

    func append___VARIABLE_entityName___s(_ data: [___VARIABLE_entityName___], nextPageNumber: Int?) {
        customDataSource.appendData(data, nextPageNumber: nextPageNumber)
    }
}
