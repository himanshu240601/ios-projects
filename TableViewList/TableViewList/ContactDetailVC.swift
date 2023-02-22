//
//  ContactDetailVC.swift
//  TableViewList
//
//  Created by Himanshu on 2/21/23.
//

import UIKit

class ContactDetailVC: UIViewController {
    
    // MARK: outlets
    @IBOutlet weak var nameTextLabel: UILabel!
    @IBOutlet weak var numberTextLabel: UILabel!
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var messageButton: UIButton!
    @IBOutlet weak var videoCallButton: UIButton!
    
    
    // MARK: properties
    var contact: Contacts?
    
    // MARK: class objects
    var contactsCrud = ContactCRUD.contactCRUD
    var alertActions = AlertActions()
    
    // MARK: lifecycle functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem
            .rightBarButtonItems =
        [
            UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(deleteContact)),
            UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(updateContact))
        ]
        
        setDataValues()
    }
    
    
    // MARK: update data values
    func setDataValues() {
        nameTextLabel.text = contact?.name ?? ""
        numberTextLabel.text = contact?.mobile ?? ""
        
        if (contact?.mobile == "") {
            toggleButtons(false)
        }else {
            toggleButtons(true)
        }
    }
    
    func toggleButtons(_ enabled: Bool) {
        callButton.isEnabled = enabled
        messageButton.isEnabled = enabled
        videoCallButton.isEnabled = enabled
    }
}

// MARK: contact functions update, deleted
extension ContactDetailVC {
    
    @objc func deleteContact() {
        let alertController = UIAlertController(title: "Are You Sure?", message: nil, preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .default))
        alertController.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { UIAlertAction in
            self.navigationController?.popViewController(animated: true)
            //delete from the objects
        }))
        
        present(alertController, animated: true)
    }
    
    @objc func updateContact() {
        let alertController =
        UIAlertController(title: "Update Contact", message: nil, preferredStyle: .alert)
        
        alertActions
            .addTextField(alertController: alertController, position: 0, placeholder: "Name")
        alertActions
            .addTextField(alertController: alertController, position: 1, placeholder: "Number")
        
        //set values to textfields
        alertController.textFields?[0].text = nameTextLabel.text
        alertController.textFields?[1].text = numberTextLabel.text
        
        
        alertController
            .addAction(UIAlertAction(title: "Cancel", style: .destructive))
        
        alertController
            .addAction(UIAlertAction(title: "Save", style: .default, handler: { UIAlertAction in
                let name = alertController
                    .textFields?[0].text
                let number = alertController
                    .textFields?[1].text
                
                self.contactsCrud
                    .updateContact(contact: self.contact!, name: name!, number: number!)
                
                self.setDataValues()
        }))
        
        present(alertController, animated: true)
    }
    
}
