//
//  ViewControllerTableView.swift
//  TableViewList
//
//  Created by Himanshu on 2/22/23.
//

import Foundation
import UIKit

// MARK: ViewController extension for tableView functions
extension ViewController {
    
    // MARK: creating tableview sections and cells
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sortContacts.sectionTitles.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortContacts.sortedContactList[sortContacts.sectionTitles[section]]?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Contact", for: indexPath)
        
        cell.textLabel?
            .text = sortContacts.sortedContactList[sortContacts.sectionTitles[indexPath.section]]?[indexPath.row].name
        cell.imageView?
            .image = UIImage(systemName: "person")
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contact = sortContacts.sortedContactList[sortContacts.sectionTitles[indexPath.section]]?[indexPath.row]
        performSegue(withIdentifier: "ViewContact", sender: (contact, indexPath))
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sortContacts.sectionTitles[section]
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        tableView.sectionIndexColor = .placeholderText
        return sortContacts.sectionTitles
    }
    
    // MARK: table view swipe gestures
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        // MARK: swipe left to delete
        if editingStyle == .delete {
            let ac = alertActions.deleteContactAlert()
            ac.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { UIAlertAction in
                self.contactsCrud.deleteContact(indexPath: indexPath)
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
                
                if self.sortContacts
                    .sortedContactList[
                        self.sortContacts.sectionTitles[indexPath.section]
                    ] == nil{
                    
                    self.sortContacts.sectionTitles.remove(at: indexPath.section)
                    self.tableView.deleteSections(IndexSet(integer: indexPath.section), with: .automatic)
                    
                }
            }))
            
            present(ac, animated: true)
        }
    }
    
    // MARK: navigate to next view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationViewController = segue.destination as! ContactDetailVC
        destinationViewController.data = sender as? (Contacts, IndexPath)
    }
}
