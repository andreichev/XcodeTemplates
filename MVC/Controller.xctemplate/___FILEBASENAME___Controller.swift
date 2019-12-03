//___FILEHEADER___

import SharedBusinessLogic
import UIComponents
import XCoordinator

public class ___VARIABLE_sceneName___Controller: UIViewController {
    // MARK: - Properties

    public var router: StrongRouter<Routes>?

    lazy var customView = ___VARIABLE_sceneName___View()

    // MARK: - Life cycle

    public override func loadView() {
        view = customView
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        setTitle()
    }

    private func setTitle() {
        title = Text.___VARIABLE_sceneName___.title
    }
}
