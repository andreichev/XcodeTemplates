// ___FILEHEADER___

protocol ___VARIABLE_cellName___Delegate: AnyObject {}

final class ___VARIABLE_cellName___: UITableViewCell {
    // MARK: - Properties

    weak var delegate: ___VARIABLE_cellName___Delegate?

    // MARK: - Xib init

    override func awakeFromNib() {
        super.awakeFromNib()
        setupStyle()
        addActionHandlers()
    }

    private func setupStyle() {}

    // MARK: - Action handlers

    private func addActionHandlers() {}

    // MARK: - Internal methods

    func configure(
        delegate: ___VARIABLE_cellName___Delegate
    ) {
        self.delegate = delegate
    }
}
