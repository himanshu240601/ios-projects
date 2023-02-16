//
//  PasswordValidation.swift
//  AutoLayout
//
//  Created by Himanshu on 2/16/23.
//

import Foundation

class PasswordValidation {
    
    func isValidPassword(password: String) -> (Bool, String) {
        if password.isEmpty {
            return (false, "Please Input Your Password.")
        } else if password.count < 8 {
            return (false, "Password Requires Atleast 8 Characters")
        } else if password.count > 16 {
            return (false, "Password Length Exceeds Max Length. Must Be Less Than 16 Characters.")
        } else if checkForSpecialCharacters(password: password){
            return (false, "Invalid Password. Emoji's Are Not Allowed.")
        }
        return (true, "")
    }
    
    func checkForSpecialCharacters(password: String) -> Bool{
        let characterset = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789~`!@#$%^&*()_-+={[}]|\\:;\"'<,>.?/")
        
        return password.rangeOfCharacter(from: characterset.inverted) != nil
    }
    
}
