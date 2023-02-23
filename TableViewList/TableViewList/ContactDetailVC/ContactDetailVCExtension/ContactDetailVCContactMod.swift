//
//  ContactDetailVCContactMod.swift
//  TableViewList
//
//  Created by Himanshu on 2/22/23.
//

import Foundation
import UIKit

// MARK: extension for ContactDetailVC contact functions update, deleted
extension ContactDetailVC {
    
    // MARK: methods
    
    //delete contact
    @objc func deleteContact() {
        let alertController = alertActions.deleteContactAlert()
        alertController.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { UIAlertAction in
            self.contactsCrud.deleteContact(indexPath: self.data!.1)
            self.sortContacts.sectionTitles.remove(at: self.data!.1.section)
            self.navigationController?.popViewController(animated: true)
        }))
        
        present(alertController, animated: true)
    }
    
    //update contact
    @objc func updateContact() {
        let alertController = alertActions
            .editContactAlert(name: nameTextLabel.text!, number: numberTextLabel.text!)
        
        alertController
            .addAction(UIAlertAction(title: "Save", style: .default, handler: { UIAlertAction in
                let name = alertController
                    .textFields?[0].text
                let number = alertController
                    .textFields?[1].text
                
                self.contactsCrud
                    .updateContact(contact: self.data!.0, name: name!, number: number!)
                
                self.setDataValues()
        }))
        
        present(alertController, animated: true)
    }
    
}
