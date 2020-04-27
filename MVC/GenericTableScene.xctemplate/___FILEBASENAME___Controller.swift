//___FILEHEADER___

import MDFoundation
import General
import MDCoordinator

protocol ___VARIABLE_sceneName___ControllerLogic: AnyObject {
    func present___VARIABLE_entityName___(_ entity: ___VARIABLE_entityName___)
    func presentError(message: String)
}

public class ___VARIABLE_sceneName___Controller: UIViewController, ___VARIABLE_sceneName___ControllerLogic {
    // MARK: - Properties

    public var router: Router<___VARIABLE_entityName___Routes>?

    lazy var customView = ___VARIABLE_sceneName___View()
    var interactor: ___VARIABLE_sceneName___Interactor?

    let generator = UINotificationFeedbackGenerator()

    // MARK: - Life cycle

    public override func loadView() {
        view = customView
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
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
        customView.tableBuilder?.delegate = self
    }

    // MARK: - Network requests

    private func load___VARIABLE_entityName___() {
        interactor.load___VARIABLE_entityName___()
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
    public func reloadAction() {}
}
