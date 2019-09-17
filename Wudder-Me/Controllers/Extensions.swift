//
//  Extensions.swift
//  Wudder-Me
//
//  Created by EricM on 9/17/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewCell {
    func updateWithTimer(time: Int) {
        self.detailTextLabel?.text = "Time Left: \(time.description )" 
    }
}
