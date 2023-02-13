//
//  UIColor+Ext.swift
//  RandomColorGenerator
//
//  Created by Himanshu on 2/13/23.
//

import UIKit

extension UIColor {
    
    static func generateRandomColor() -> UIColor {
        let randomCol = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
        
        return randomCol
    }
    
}
