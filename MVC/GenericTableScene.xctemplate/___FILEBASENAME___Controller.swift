//___FILEHEADER___

import MDFoundation
import SharedBusinessLogic
import SharedComponents
import XCoordinator

protocol ___VARIABLE_sceneName___ControllerLogic: AnyObject {
    func present___VARIABLE_entityName___(_ entity: ___VARIABLE_entityName___)
    func presentError(message: String)
}

public class ___VARIABLE_sceneName___Controller: UIViewController, ___VARIABLE_sceneName___ControllerLogic {
    // MARK: - Properties

    public var router: StrongRouter<___VARIABLE_entityName___Routes>?

    lazy var customView = ___VARIABLE_sceneName___View()
    lazy var interactor = ___VARIABLE_sceneName___Interactor(controller: self)

    // MARK: - Life cycle

    public override func loadView() {
        view = customView
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
        load___VARIABLE_entityName___()
    }

    private func setupAppearance() {
        extendedLayoutIncludesOpaqueBars = true
        title = Text.___VARIABLE_entityName___.title
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
        customView.showEmptyPage()
        guard message != .empty else { return }
        let alert = AlertsFactory.error(
            title: Text.Alert.error,
            message: message,
            cancelText: Text.Alert.cancel
        )
        present(alert, animated: true, completion: nil)
    }
}
