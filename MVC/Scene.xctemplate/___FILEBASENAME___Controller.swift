//___FILEHEADER___

import MDCoordinator
import MDFoundation
import SharedComponents

protocol ___VARIABLE_sceneName___ControllerLogic: AnyObject {
    func didFinishRequest(viewModel: ___VARIABLE_sceneName___.ViewModel)
    func presentError(message: String)
}

public class ___VARIABLE_sceneName___Controller: UIViewController, ___VARIABLE_sceneName___ControllerLogic {
    // MARK: - Properties

    public var router: StrongRouter<Routes>?
    var interactor: ___VARIABLE_sceneName___Interactor?

    lazy var customView = ___VARIABLE_sceneName___View()

    // MARK: - Life cycle

    public override func loadView() {
        view = customView
    }

    public override func viewDidLoad() {
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

    func didFinishRequest(viewModel:  ___VARIABLE_sceneName___.ViewModel) {
        customView.stopShowingActivityIndicator()
        customView.display(viewModel: viewModel)
    }

    func presentError(message: String) {
        customView.stopShowingActivityIndicator()
        guard message != .empty else { return }
        let alert = AlertsFactory.plain(
            title: Text.Alert.error,
            message: message,
            cancelText: Text.Alert.cancel
        )
        present(alert, animated: true, completion: nil)
    }
}
