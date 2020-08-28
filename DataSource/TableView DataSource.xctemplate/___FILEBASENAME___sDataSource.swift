// ___FILEHEADER___

import SharedComponents
import BusinessLogic

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
        tableView.register(
            ___VARIABLE_entityName___Cell.nib,
            forCellReuseIdentifier: ___VARIABLE_entityName___Cell.identifier
        )
        tableView.register(
            ErrorCell.nib,
            forCellReuseIdentifier: ErrorCell.identifier
        )
        tableView.register(
            NoContentCell.self,
            forCellReuseIdentifier: NoContentCell.identifier
        )
        tableView.register(
            LoadingCell.self,
            forCellReuseIdentifier: LoadingCell.identifier
        )
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

    func reloadData(animated: Bool) {
        if animated {
            let range = NSRange(location: 0, length: 1)
            let sections = NSIndexSet(indexesIn: range)
            tableView?.reloadSections(sections as IndexSet, with: .fade)
        } else {
            tableView?.reloadData()
        }
    }

    func loadNextPage() {
        guard let nextPage = nextPageNumber else { return }
        delegate?.loadPage(page: nextPage)
    }
}

// MARK: - UITableViewDataSource

extension ___VARIABLE_entityName___sDataSource: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
            let cell = tableView.dequeueReusableCell(
                withIdentifier: LoadingCell.identifier,
                for: indexPath
            ) as? LoadingCell

            cell?.configure()
            return cell ?? UITableViewCell()
        case .error:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: ErrorCell.identifier,
                for: indexPath
            ) as? ErrorCell
            cell?.delegate = self
            cell?.configure(with: errorMessage ?? .empty)
            return cell ?? UITableViewCell()
        case .noContent:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: NoContentCell.identifier,
                for: indexPath
            ) as? NoContentCell
            cell?.configure(text: Text.ClientOrders.noContent)
            return cell ?? UITableViewCell()
        case .presentingList:
            if indexPath.row < data.count {
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: ___VARIABLE_entityName___Cell.identifier,
                    for: indexPath
                ) as? ___VARIABLE_entityName___Cell
                let item = data[indexPath.row]
                cell?.configure(with: item)
                return cell ?? UITableViewCell()
            } else {
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: LoadingCell.identifier,
                    for: indexPath
                ) as? LoadingCell

                cell?.configure(height: 50)
                return cell ?? UITableViewCell()
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
            state == .presentingList {
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
