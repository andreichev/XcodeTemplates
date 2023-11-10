// ___FILEHEADER___

import MDCoordinator
import MDFoundation

protocol ___VARIABLE_sceneName___ControllerLogic where Self: AnyObject {
    func didFinishRequest()
    func presentError(message: String)
}

final class ___VARIABLE_sceneName___Controller: UIViewController, ___VARIABLE_sceneName___ControllerLogic {
    // MARK: - Properties

    var router: Router<Routes>?
    private var interactor: ___VARIABLE_sceneName___Interactor?

    lazy var customView = ___VARIABLE_sceneName___View()

    // MARK: - Life cycle

    override func loadView() {
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupAppearance()
        addActionHandlers()
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
