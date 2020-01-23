// ___FILEHEADER___

import UIKit

public final class ___VARIABLE_cellName___: UITableViewCell {
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

    func commonInit() {
        setupStyle()
        addSubviews()
        makeConstraints()
    }

    // MARK: - Private methods

    private func setupStyle() {
    }

    private func addSubviews() {
    }

    private func makeConstraints() {
    }
}
