//___FILEHEADER___

import MDFoundation
import UIComponents

final class ___VARIABLE_sceneName___View: UIView {
    struct Appearance: Grid {}

    // MARK: - Properties

    let appearance = Appearance()

    // MARK: - Init

    override init(frame: CGRect = UIScreen.main.bounds) {
        super.init(frame: frame)
        setupStyle()
        addSubviews()
        makeConstraints()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupStyle() {}

    private func addSubviews() {}

    private func makeConstraints() {}

    // MARK: - Public methods

    // TODO: - Показать ошибку загрузки
    public func showErrorLoadingContent() {}
}
