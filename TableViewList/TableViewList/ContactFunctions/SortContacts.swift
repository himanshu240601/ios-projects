//
//  SortContacts.swift
//  TableViewList
//
//  Created by Himanshu on 2/22/23.
//

import Foundation

class SortContacts {
    // MARK: instances
    static let sortContacts = SortContacts()
    
    // MARK: properties
    var sectionTitles: [String] = []
    var sortedContactList: [String: [Contacts]] = [:]
    
    // MARK: initializers
    private init() {
    }
    
    // MARK: methods
    func createSectionTitles(contactsCRUD: ContactCRUD) {
        sectionTitles = Array(Set(contactsCRUD.contactObjectsArray.compactMap({String($0.name.prefix(1)).uppercased()})))
        sectionTitles.sort()
        
        setDataForSections(contactsCRUD: contactsCRUD)
    }
    
    func setDataForSections(contactsCRUD: ContactCRUD) {
        for title in sectionTitles{
            sortedContactList[title] = [Contacts]()
        }
        
        for contact in contactsCRUD.contactObjectsArray{
            sortedContactList[String(contact.name.prefix(1)).uppercased()]?.append(contact)
        }
    }
}
