//
//  ActionAlerts.swift
//  TableViewList
//
//  Created by Himanshu on 2/21/23.
//

import Foundation
import UIKit

class AlertActions {
    
    // MARK: methods
    func addTextField(alertController: UIAlertController, position: Int, placeholder: String) {
        alertController.addTextField()
        alertController.textFields?[position].placeholder = placeholder
        alertController.textFields?[position].clearButtonMode = .whileEditing
        
        if(placeholder == "Number") {
            alertController.textFields?[position].keyboardType = .phonePad
        }
    }
    
}
