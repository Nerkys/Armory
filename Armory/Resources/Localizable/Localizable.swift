//
//  Localizable.swift
//  Armory
//
//  Created by Mikhail Chukhvantsev on 11.10.2021.
//

import UIKit

@propertyWrapper
struct Localizable {
   var wrappedValue: String {
       didSet { wrappedValue = NSLocalizedString(wrappedValue, comment: "") }
   }

   init(wrappedValue: String) {
       self.wrappedValue = NSLocalizedString(wrappedValue, comment: "")
   }
}

enum Strings {
    @Localizable static var taskListScreen_taskType_current = "taskListScreen_taskType_current"
    @Localizable static var taskListScreen_taskType_important = "taskListScreen_taskType_important"
    @Localizable static var taskListScreen_finished = "taskListScreen_finished"
}

final class UILocalizedLabel: UILabel {
    override func awakeFromNib() {
        super.awakeFromNib()
        @Localizable var value = text!
        text = value
    }
}

final class UILocalizedButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        @Localizable var value = self.title(for: .normal)!
        setTitle(value, for: .normal)
    }
}

final class UILocalizedTextField: UITextField {
    override func awakeFromNib() {
        super.awakeFromNib()
        @Localizable var value = placeholder!
        placeholder = value
    }
}

