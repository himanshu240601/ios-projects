//
//  ViewControllerContactMod.swift
//  TableViewList
//
//  Created by Himanshu on 2/22/23.
//

import Foundation
import UIKit

// MARK: ViewController extension of functions for adding, removing, updating the contact
extension ViewController {
    
    @objc func addNewContact() {
        let alertController =
        UIAlertController(title: "Add New Contact", message: nil, preferredStyle: .alert)
        
        alertActions
            .addTextField(alertController: alertController, position: 0, placeholder: "Name")
        alertActions
            .addTextField(alertController: alertController, position: 1, placeholder: "Number")
        
        
        alertController
            .addAction(UIAlertAction(title: "Cancel", style: .destructive))
        
        alertController
            .addAction(UIAlertAction(title: "Save", style: .default, handler: { UIAlertAction in
                var name = alertController
                    .textFields?[0].text
                let number = alertController
                    .textFields?[1].text
                
                if name == "" && number != "" {
                    name = number
                }
                
                self.contactsCrud
                    .addContact(name: name!, number: number!)
                
                self.tableView
                    .reloadData()
        }))
        
        present(alertController, animated: true)
    }
}
