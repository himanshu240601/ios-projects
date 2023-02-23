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
    var data: (Contacts, IndexPath)?
    
    // MARK: class objects
    var contactsCrud = ContactCRUD.contactCRUD
    var alertActions = AlertActions()
    var sortContacts = SortContacts.sortContacts
    
    // MARK: lifecycle methods
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
    
    // MARK: actions
    @IBAction func messageButtonTapped(_ sender: UIButton) {
        let sms = "sms:\(numberTextLabel.text!)&body="
        let strURL = sms.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        UIApplication.shared.open(URL(string: strURL)!, options: [:], completionHandler: nil)
    }
    
    @IBAction func callButtonTapped(_ sender: UIButton) {
//        let phoneNumber = "+123123123"
//        let numberUrl = URL(string: "phone://\(phoneNumber)")!
//        if UIApplication.shared.canOpenURL(numberUrl) {
//            UIApplication.shared.open(numberUrl)
//        }
    }
}
