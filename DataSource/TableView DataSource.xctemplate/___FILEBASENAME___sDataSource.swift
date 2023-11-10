// ___FILEHEADER___

import UIKit

protocol ___VARIABLE_entityName___sDataSourceDelegate: AnyObject {
    func loadPage(page: Int)
    func didSelect___VARIABLE_entityName___(_ item: ___VARIABLE_entityName___)
    func actionButtonTapped()
}

final class ___VARIABLE_entityName___sDataSource: NSObject {
    // MARK: - Properties

    enum State {
        case loading
        case presentingList
        case noContent
        case error
    }

    private var data: [___VARIABLE_entityName___] = []
    private var tableView: UITableView?
    private var nextPageNumber: Int?

    weak var delegate: ___VARIABLE_entityName___sDataSourceDelegate?

    var errorMessage: String?
    var state: State = .loading {
        didSet {
            reloadData(animated: true)
        }
    }

    var isLoadingNextPage: Bool = false

    // MARK: - Internal methods

    func setTableView(_ tableView: UITableView) {
        self.tableView = tableView
        tableView.registerCell(ofType: ___VARIABLE_entityName___Cell.self)
        tableView.registerCell(ofType: ErrorTableViewCell.self)
        tableView.registerCell(ofType: NoContentCell.self)
        tableView.registerCell(ofType: LoadingCell.self)
        tableView.dataSource = self
        tableView.delegate = self
    }

    func updateData(_ data: [___VARIABLE_entityName___], nextPageNumber: Int?) {
        self.data = data
        self.nextPageNumber = nextPageNumber
        isLoadingNextPage = false
        if data.isEmpty {
            state = .noContent
        } else {
            state = .presentingList
        }
    }

    func appendData(_ data: [___VARIABLE_entityName___], nextPageNumber: Int?) {
        self.data.append(contentsOf: data)
        self.nextPageNumber = nextPageNumber
        isLoadingNextPage = false
        reloadData(animated: false)
    }

    // MARK: - Private methods

    private func reloadData(animated: Bool) {
        if animated {
            let range = NSRange(location: 0, length: 1)
            let sections = NSIndexSet(indexesIn: range)
            tableView?.reloadSections(sections as IndexSet, with: .fade)
        } else {
            tableView?.reloadData()
        }
    }

    private func loadNextPage() {
        guard let nextPage = nextPageNumber else { return }
        delegate?.loadPage(page: nextPage)
    }
}

// MARK: - UITableViewDataSource

extension ___VARIABLE_entityName___sDataSource: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        if state == .presentingList {
            if isLoadingNextPage {
                return data.count + 1
            } else {
                return data.count
            }
        } else {
            return 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch state {
        case .loading:
            let cell = tableView.dequeueReusableCell(LoadingCell.self, for: indexPath)
            cell.configure()
            return cell
        case .error:
            let cell = tableView.dequeueReusableCell(ErrorTableViewCell.self, for: indexPath)
            cell.delegate = self
            return cell
        case .noContent:
            let cell = tableView.dequeueReusableCell(NoContentCell.self, for: indexPath)
            cell.configure(text: Text.___VARIABLE_sceneName___.noContent)
            return cell
        case .presentingList:
            if indexPath.row < data.count {
                let cell = tableView.dequeueReusableCell(___VARIABLE_entityName___Cell.self, for: indexPath)
                let item = data[indexPath.row]
                cell.configure(item)
                cell.delegate = self
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(LoadingCell.self, for: indexPath)
                cell.configure(height: 50)
                return cell
            }
        }
    }
}

// MARK: - UITableViewDelegate

extension ___VARIABLE_entityName___sDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if state == .presentingList, indexPath.row < data.count {
            let item = data[indexPath.row]
            delegate?.didSelect___VARIABLE_entityName___(item)
        }
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (scrollView.contentOffset.y + scrollView.frame.size.height)
            > scrollView.contentSize.height,
            isLoadingNextPage == false, nextPageNumber != nil,
            state == .presentingList
        {
            isLoadingNextPage = true
            reloadData(animated: false)
            loadNextPage()
        }
    }
}

// MARK: - Action handlers

extension ___VARIABLE_entityName___sDataSource: ErrorCellDelegate {
    func reloadData() {
        delegate?.actionButtonTapped()
    }
}
