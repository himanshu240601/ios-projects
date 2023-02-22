//
//  ViewController.swift
//  TableViewList
//
//  Created by Himanshu on 2/21/23.
//

import UIKit

class ViewController: UITableViewController {
    
    // MARK: class objects
    var staticData = StaticData()
    var contactsCrud = ContactCRUD.contactCRUD
    var alertActions = AlertActions()
    var sortContacts = SortContacts.sortContacts
    
    // MARK: lifecycle functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem
            .rightBarButtonItem =
        UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewContact))
        
        staticData.generateDummyData(contactsCrud: contactsCrud)
        sortContacts.createSectionTitles(contactsCRUD: contactsCrud)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
}

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
                
                self.sortContacts.createSectionTitles(contactsCRUD: self.contactsCrud)
                
                self.tableView
                    .reloadData()
        }))
        
        present(alertController, animated: true)
    }
}

// MARK: ViewController extension for tableView functions
extension ViewController {
    
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
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        if editingStyle == .delete {
            
            let ac = UIAlertController(title: "Are You Sure?", message: nil, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Cancel", style: .default))
            ac.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { UIAlertAction in
                self.contactsCrud.deleteContact(indexPath: indexPath)
                self.tableView.deleteRows(at: [indexPath], with: .fade)
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

