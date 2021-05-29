// ___FILEHEADER___

import MDFoundation
import MDCoordinator

protocol ___VARIABLE_sceneName___ControllerLogic: AnyObject {
    func didFinishRequest()
    func presentError(message: String)
}

class ___VARIABLE_sceneName___Controller: UIViewController, ___VARIABLE_sceneName___ControllerLogic {
    // MARK: - Properties

    var router: Router<Routes>?
    var interactor: ___VARIABLE_sceneName___Interactor?

    lazy var customView: ___VARIABLE_sceneName___View? = view as? ___VARIABLE_sceneName___View

    // MARK: - Init

    init() {
        super.init(
            nibName: Utils.getClassName(___VARIABLE_sceneName___View.self),
            bundle: resourcesBundle
        )
        setup()
        setupAppearance()
        addActionHandlers()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        interactor = ___VARIABLE_sceneName___Interactor()
        interactor?.controller = self
    }

    private func setupAppearance() {
        // title = Text.___VARIABLE_sceneName___.title
    }

    // MARK: - Action handlers

    private func addActionHandlers() {}

    // MARK: - ___VARIABLE_sceneName___ControllerLogic

    func didFinishRequest() {
        customView?.stopShowingActivityIndicator()
        customView?.displaySomething()
    }

    func presentError(message: String) {
        customView?.stopShowingActivityIndicator()
        guard message != .empty else { return }
        let alert = AlertsFactory.plain(
            title: Text.Alert.error,
            message: message,
            tintColor: Assets.baseTint1.color,
            cancelText: Text.Alert.cancel
        )
        present(alert, animated: true, completion: nil)
    }
}
