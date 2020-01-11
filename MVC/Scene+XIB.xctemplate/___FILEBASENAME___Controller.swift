// ___FILEHEADER___

import MDFoundation
import SharedComponents
import XCoordinator

public class ___VARIABLE_sceneName___Controller: UIViewController {
    // MARK: - Properties

    public var router: StrongRouter<Routes>?

    lazy var customView = XibInitializer.loadFromXib(type: ___VARIABLE_sceneName___View.self)

    // MARK: - Life cycle

    public override func loadView() {
        view = customView
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
    }

    private func setupAppearance() {
        // title = Text.___VARIABLE_sceneName___.title
    }
}
