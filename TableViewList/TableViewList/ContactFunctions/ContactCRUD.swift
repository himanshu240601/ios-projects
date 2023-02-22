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
    let sortContacts = SortContacts.sortContacts
    var contactObjectsArray = [Contacts]()
    
    // MARK: initializers
    private init() {}
    
    // MARK: methods
    func addContact(name: String, number: String) {
        let contact = Contacts(name: name, mobile: number)
        contactObjectsArray.insert(contact, at: 0)
    }
    
    func deleteContact(indexPath: IndexPath) {
        let contact = sortContacts
            .sortedContactList[
                self.sortContacts.sectionTitles[indexPath.section]
            ]?.remove(at: indexPath.row)
        
        //removing elements from the static data
        //so no element is regenerated when a new value
        //is added
        for i in 0..<contactObjectsArray.count {
            if (contact?.mobile == contactObjectsArray[i].mobile) {
                contactObjectsArray.remove(at: i)
                break
            }
        }
    }
    
    func updateContact(contact: Contacts, name: String, number: String) {
        contact.name = name
        contact.mobile = number
    }
}
