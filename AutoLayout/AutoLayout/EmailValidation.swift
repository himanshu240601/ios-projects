//
//  InputValidation.swift
//  AutoLayout
//
//  Created by Himanshu on 2/16/23.
//

import Foundation

class EmailValidation {
    
    func isValidEmail(emailID: String) -> (Bool, String) {
        
        if emailID.isEmpty {
            return (false, "Please Input Your Email Address.")
        }
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        if emailTest.evaluate(with: emailID) {
            return (true, "")
        }
        
        return (false, "The Email Address You've Entered Is Invalid.")
    }
    
}
