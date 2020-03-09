//
//  ___VARIABLE_cellName___.swift
//  SharedComponents
//
//  Created by Михаил Андреичев on 19.02.2020.
//

public protocol ___VARIABLE_cellName___Delegate: AnyObject {}

public final class ___VARIABLE_cellName___: UITableViewCell {
    // MARK: - Properties

    @IBOutlet var titleLabel: UILabel!

    // MARK: - Xib init

    public override func awakeFromNib() {
        super.awakeFromNib()
        setupStyle()
        addActionHandlers()
    }

    private func setupStyle() {}

    // MARK: - Action handlers

    private func addActionHandlers() {}

    // MARK: - Public methods

    public func configure(
        delegate: ___VARIABLE_cellName___Delegate
    ) {
        self.delegate = delegate
    }
}
