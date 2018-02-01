//
//  RuleSelectionTableCellView.swift
//  SwiftFormat for Xcode
//
//  Created by Vincent Bernier on 28-01-18.
//  Copyright © 2018 Nick Lockwood.
//
//  Distributed under the permissive MIT license
//  Get the latest version from here:
//
//  https://github.com/nicklockwood/SwiftFormat
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import Cocoa

final class RuleSelectionTableCellView: NSTableCellView {

    @IBOutlet var checkbox: NSButton!

    @IBAction func toggleCheckbox(_ sender: NSButton) {
        guard let model = objectValue as? RulesViewController.RuleViewModel else {
            return
        }

        model.isEnabled = (sender.state == .on)
    }

    override var objectValue: Any? {
        didSet {
            guard let model = objectValue as? RulesViewController.RuleViewModel else {
                return
            }

            checkbox.title = model.name
            checkbox.state = model.isEnabled ? .on : .off
        }
    }
}

extension NSUserInterfaceItemIdentifier {
    static let ruleSelectionTableCellView = NSUserInterfaceItemIdentifier(rawValue: "RuleSelectionTableCellView")
}