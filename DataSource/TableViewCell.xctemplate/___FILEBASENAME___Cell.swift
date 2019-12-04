// ___FILEHEADER___

import UIKit

public final class ___VARIABLE_cellName___: UITableViewCell {
    struct Appearance: Grid {}

    // MARK: - Properties

    private let appearance = Appearance()

    // MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupStyle()
        addSubviews()
        makeConstraints()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private methods

    private func setupStyle() {
    }

    private func addSubviews() {
    }

    private func makeConstraints() {
    }
}
