// ___FILEHEADER___

import UIKit

final class ___VARIABLE_cellName___: UITableViewCell {
    struct Appearance {}

    // MARK: - Properties

    // MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        setupStyle()
        addSubviews()
        makeConstraints()
    }

    private func setupStyle() {}

    private func addSubviews() {}

    private func makeConstraints() {}

    // MARK: - Internal methods

    func configure() {}
}
