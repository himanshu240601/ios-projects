//
//  ContactCRUD.swift
//  TableViewList
//
//  Created by Himanshu on 2/21/23.
//

import Foundation

class ContactCRUD {
    // MARK: properties
    static let contactCRUD = ContactCRUD()
    var contactObjectsArray = [Contacts]()
    
    // MARK: initializers
    private init() {}
    
    // MARK: functions
    func addContact(name: String, number: String) {
        contactObjectsArray.insert(Contacts(name: name, mobile: number), at: 0)
    }
    
    func readContact() {
        
    }
    
    func deleteContact() {
        
    }
    
    func updateContact(contact: Contacts, name: String, number: String) {
        contact.name = name
        contact.mobile = number
    }
}
