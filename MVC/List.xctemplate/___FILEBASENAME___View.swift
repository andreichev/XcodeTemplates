//___FILEHEADER___

import Foundation
import General
import MDFoundation
import General

final class ___VARIABLE_sceneName___View: UITableView {
    // MARK: - Properties

    private var customDataSource: ___VARIABLE_entityName___sDataSource = ___VARIABLE_entityName___sDataSource()

    // MARK: - Init

    override init(frame: CGRect = UIScreen.main.bounds, style: UITableView.Style = .plain) {
        super.init(frame: frame, style: style)
        setupStyle()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupStyle() {
        customDataSource.setTableView(self)
        backgroundColor = Assets.background1.color
        refreshControl = UIRefreshControl()
        tableFooterView = UIView()
        rowHeight = UITableView.automaticDimension
        separatorInset = .zero
        estimatedRowHeight = 125
        contentInset.bottom = 100
        contentInsetAdjustmentBehavior = .always
    }

    // MARK: - Internal methods

    func setDelegate(_ delegate: ___VARIABLE_entityName___sDataSourceDelegate) {
        customDataSource.delegate = delegate
    }

    func endRefreshing() {
        refreshControl?.endRefreshing()
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
