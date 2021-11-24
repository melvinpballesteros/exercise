//
//  Extensions+UIView.swift
//  app_exercise_mballesteros
//
//  Created by Melvin Ballesteros on 11/24/21.
//

import UIKit

extension UIView {
    public func setSubviewForAutoLayout(_ subviews: UIView...) {
        subviews.forEach{ subview in
            subview.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(subview)
        }
    }
    
    public func setSubviewsForAutoLayout(_ subviews: [UIView]) {
        subviews.forEach{ self.setSubviewForAutoLayout($0)}
    }

}
