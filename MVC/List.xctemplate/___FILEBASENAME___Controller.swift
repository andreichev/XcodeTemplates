// ___FILEHEADER___

import MDCoordinator
import MDFoundation

protocol ___VARIABLE_sceneName___ControllerLogic where Self: AnyObject {
    func displayList(response: ___VARIABLE_entityName___ListResponse)
    func presentError(message: String)
}

final class ___VARIABLE_sceneName___Controller: UIViewController, ___VARIABLE_sceneName___ControllerLogic {
    // MARK: - Properties

    var router: Router<___VARIABLE_sceneName___ControllerRoutes>?
    private var interactor: ___VARIABLE_sceneName___Interactor?

    lazy var customView = ___VARIABLE_sceneName___View()
    lazy var notificationFeedbackGenerator = UINotificationFeedbackGenerator()

    // MARK: - Life cycle

    override func loadView() {
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupAppearance()
        addActionHandlers()
        load___VARIABLE_entityName___s()
    }

    private func setup() {
        interactor = ___VARIABLE_sceneName___Interactor()
        interactor?.controller = self
    }

    private func setupAppearance() {
        title = Text.___VARIABLE_sceneName___.title
        extendedLayoutIncludesOpaqueBars = true
    }

    // MARK: - Network requests

    @objc
    private func load___VARIABLE_entityName___s() {
        interactor?.loadList(page: 0)
    }

    // MARK: - Action handlers

    private func addActionHandlers() {
        customView.tableView.refreshControl?.addTarget(
            self,
            action: #selector(load___VARIABLE_entityName___s),
            for: .valueChanged
        )
        customView.setDelegate(self)
    }

    // MARK: - ___VARIABLE_sceneName___ControllerLogic

    func displayList(
        loadedPage: Int, nextPage: Int?, response: [___VARIABLE_entityName___]
    ) {
        customView.endRefreshing()
        if loadedPage != 0 {
            customView.append___VARIABLE_entityName___s(response, nextPageNumber: nextPage)
        } else {
            customView.update___VARIABLE_entityName___s(response, nextPageNumber: nextPage)
        }
    }

    func presentError(message: String) {
        customView.endRefreshing()
        notificationFeedbackGenerator.notificationOccurred(.error)
        customView.showError(message: message)
    }
}

// MARK: - ___VARIABLE_entityName___sDataSourceDelegate

extension ___VARIABLE_sceneName___Controller: ___VARIABLE_entityName___sDataSourceDelegate {
    func loadPage(page: Int) {
        interactor?.loadList(page: page)
    }

    func didSelect___VARIABLE_entityName___(_: ___VARIABLE_entityName___) {
        // router?.trigger(.openItem(delegate: self, item: item))
    }

    func actionButtonTapped() {
        customView.showLoading()
        load___VARIABLE_entityName___s()
    }
}
