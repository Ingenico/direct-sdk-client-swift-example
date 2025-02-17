//
// Do not remove or alter the notices in this preamble.
// This software code is created for Online Payments on 04/08/2020
// Copyright © 2020 Global Collect Services. All rights reserved.
//

import UIKit
import OnlinePaymentsKit

class PickerViewTableViewCell: TableViewCell {
    class var pickerHeight: CGFloat { return 216 }
    var pickerView = PickerView()
    override class var reuseIdentifier: String { return "picker-view-cell" }

    var delegate: UIPickerViewDelegate? {
        get {
            return pickerView.delegate
        }
        set {
            pickerView.delegate = newValue
        }
    }

    var dataSource: UIPickerViewDataSource? {
        get {
            return pickerView.dataSource
        }
        set {
            pickerView.dataSource = newValue
        }
    }

    var selectedRow: Int? {
        get {
            return pickerView.selectedRow(inComponent: 0)
        }
        set {
            pickerView.selectRow(newValue ?? 0, inComponent: 0, animated: false)
        }
    }
    var readonly: Bool = false {
        didSet {
            pickerView.isUserInteractionEnabled = !self.readonly
            pickerView.alpha = (self.readonly) ? 0.6 : 1.0
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(pickerView)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        let width = contentView.frame.width
        var frame = CGRect(x: 10, y: 0, width: width - 20, height: PickerViewTableViewCell.pickerHeight)
        frame.size = pickerView.sizeThatFits(frame.size)
        frame.origin.x = width/2 - frame.width/2
        pickerView.frame = frame
    }

    override func prepareForReuse() {
        delegate = nil
        dataSource = nil
        selectedRow = nil
    }
}
