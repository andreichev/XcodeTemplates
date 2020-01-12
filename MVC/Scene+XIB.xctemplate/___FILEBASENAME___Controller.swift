// ___FILEHEADER___

import MDFoundation
import SharedComponents
import XCoordinator

protocol ___VARIABLE_sceneName___ControllerLogic {
    func requestStarted()
    func didFinishRequest(viewModel: ___VARIABLE_sceneName___.ViewModel)
    func presentError(message: String)
}

public class ___VARIABLE_sceneName___Controller: UIViewController {
    // MARK: - Properties

    public var router: StrongRouter<Routes>?
    lazy var interactor = ___VARIABLE_sceneName___Interactor(controller: self)

    lazy var customView = ___VARIABLE_sceneName___View? = view as? ___VARIABLE_sceneName___View

    // MARK: - Init

    public init() {
        super.init(
            nibName: Utils.getClassName(___VARIABLE_sceneName___View.self),
            bundle: Bundle(for: ___VARIABLE_sceneName___View.self)
        )
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life cycle

    public override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
        addActionHandlers()
    }

    private func setupAppearance() {
        // title = Text.___VARIABLE_sceneName___.title
    }

    // MARK: - Action handlers

    private func addActionHandlers() {}

    // MARK: - ___VARIABLE_sceneName___ControllerLogic

    func requestStarted() {
        customView?.startShowingActivityIndicator()
    }

    func displaySomething(viewModel: ___VARIABLE_sceneName___.ViewModel) {
        customView?.stopShowingActivityIndicator()
        customView?.display(viewModel: viewModel)
    }

    func presentError(message: String) {
        customView?.stopShowingActivityIndicator()
        guard message != .empty else { return }
        let alert = AlertsFactory.error(
            title: Text.Alert.error,
            message: message,
            cancelText: Text.Alert.cancel
        )
        present(alert, animated: true, completion: nil)
    }
}
