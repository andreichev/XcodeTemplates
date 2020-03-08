// ___FILEHEADER___

import UIKit

public final class ___VARIABLE_cellName___: UITableViewCell {
    struct Appearance {}

    // MARK: - Properties

    // MARK: - Init

    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
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

    private func setupStyle() {
    }

    private func addSubviews() {
    }

    private func makeConstraints() {
    }

    // MARK: - Public methods

    public func configure() {
    }
}
