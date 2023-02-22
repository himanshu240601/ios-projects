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
        
        sortContacts.createSectionTitles(contactsCRUD: ContactCRUD.contactCRUD)
    }
    
    func deleteContact(indexPath: IndexPath) {
        let contact = sortContacts
            .sortedContactList[
                sortContacts.sectionTitles[indexPath.section]
            ]?.remove(at: indexPath.row)
        
        //TODO: if no contact in current section
        //remove that section
        if self.sortContacts
            .sortedContactList[
                self.sortContacts.sectionTitles[indexPath.section]
            ]?.count == 0 {
            self.sortContacts.sortedContactList.removeValue(forKey: sortContacts.sectionTitles[indexPath.section])
//            self.sortContacts.sectionTitles.remove(at: indexPath.section)
        }
        
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
        
        sortContacts.createSectionTitles(contactsCRUD: ContactCRUD.contactCRUD)
    }
}
