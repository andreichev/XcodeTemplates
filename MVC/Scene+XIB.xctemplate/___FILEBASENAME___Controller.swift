// ___FILEHEADER___

import MDFoundation
import MDCoordinator

protocol ___VARIABLE_sceneName___ControllerLogic: AnyObject {
    func didFinishRequest()
    func presentError(message: String)
}

final class ___VARIABLE_sceneName___Controller: UIViewController, ___VARIABLE_sceneName___ControllerLogic {
    // MARK: - Properties

    var router: Router<Routes>?
    private var interactor: ___VARIABLE_sceneName___Interactor?

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
        // customView.displaySomething()
    }

    func presentError(message: String) {
        modalAlert(message)
    }
}
