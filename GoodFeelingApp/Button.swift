//
//  Button.swift
//  CustomKeyboard
//
//  Created by JotaroSugiyama on 2019/12/08.
//  Copyright © 2019 JotaroSugiyama. All rights reserved.
//

import UIKit

class BackgroundHighlightedButton: UIButton {
    @IBInspectable var highlightedBackgroundColor :UIColor?
    @IBInspectable var nonHighlightedBackgroundColor :UIColor?
    var colorArray:[String] = ["","","",""]
    var userDefaults = UserDefaults.standard
    override var isHighlighted :Bool {
        didSet {
            if isHighlighted {
                self.backgroundColor = UIColor(hex: "C8C8C8")
            } else {
                self.backgroundColor = UIColor(hex: "343434")
            }
        }
    }
}
