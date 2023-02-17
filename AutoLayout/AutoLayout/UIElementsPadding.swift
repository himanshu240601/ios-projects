//
//  UIElementsPadding.swift
//  AutoLayout
//
//  Created by Himanshu on 2/17/23.
//

import Foundation
import UIKit

class Padding {
    
    func setPaddingToRightOfTextFields(textField: UITextField, x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) {
        let paddingTextField = UIView(frame: CGRectMake(x, y, width, height))
        textField.rightView = paddingTextField
        textField.rightViewMode = .always
    }
    
}
