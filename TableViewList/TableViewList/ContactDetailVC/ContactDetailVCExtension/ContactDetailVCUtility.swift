//
//  ContactDetailVCUtility.swift
//  TableViewList
//
//  Created by Himanshu on 2/22/23.
//

import Foundation

// MARK: contact details utility extension
extension ContactDetailVC {
    
    // MARK: methods
    
    //set values in of name and text
    func setDataValues() {
        nameTextLabel.text = data?.0.name ?? ""
        numberTextLabel.text = data?.0.mobile ?? ""
        
        toggleButtons(checkMobileNumber())
    }
    
    //check if mobil number is valid
    func checkMobileNumber() -> Bool {
        let mobile = data?.0.mobile
        
        if mobile == "" { return false }
        
        return true
    }
    
    //toggle buttons (enabled, disabled)
    func toggleButtons(_ enabled: Bool) {
        callButton.isEnabled = enabled
        messageButton.isEnabled = enabled
        videoCallButton.isEnabled = enabled
    }
}
