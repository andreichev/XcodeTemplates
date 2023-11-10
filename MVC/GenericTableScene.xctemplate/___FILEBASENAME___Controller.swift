//___FILEHEADER___

import MDFoundation
import MDCoordinator

protocol ___VARIABLE_sceneName___ControllerLogic: AnyObject {
    func present___VARIABLE_entityName___(_ entity: ___VARIABLE_entityName___)
    func presentError(message: String)
}

final class ___VARIABLE_sceneName___Controller: UIViewController, ___VARIABLE_sceneName___ControllerLogic {
    // MARK: - Properties

    var router: Router<___VARIABLE_entityName___Routes>?

    lazy var customView = ___VARIABLE_sceneName___View()
    private var interactor: ___VARIABLE_sceneName___Interactor?
    private let generator = UINotificationFeedbackGenerator()

    // MARK: - Life cycle

    override func loadView() {
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupAppearance()
        load___VARIABLE_entityName___()
    }

    private func setup() {
        interactor = ___VARIABLE_sceneName___Interactor()
        interactor?.controller = self
    }

    private func setupAppearance() {
        extendedLayoutIncludesOpaqueBars = true
        title = Text.___VARIABLE_entityName___.title
        customView.setDelegate(self)
    }

    // MARK: - Network requests

    private func load___VARIABLE_entityName___() {
        customView.showLoading()
        interactor?.load___VARIABLE_entityName___()
    }

    // MARK: - ___VARIABLE_sceneName___ControllerLogic

    func present___VARIABLE_entityName___(_ entity: ___VARIABLE_entityName___) {
        customView.updateAppearance(with: entity)
    }

    func presentError(message: String) {
        generator.notificationOccurred(.error)
        customView.showError(message: message)
    }
}

// MARK: - ___VARIABLE_sceneName___CellSetupDelegate

extension ___VARIABLE_sceneName___Controller: ___VARIABLE_sceneName___CellSetupDelegate {
    func reloadAction() {
        load___VARIABLE_entityName___()
    }
}
