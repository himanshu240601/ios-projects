//
//  ViewController.swift
//  TableViewList
//
//  Created by Himanshu on 2/21/23.
//

import UIKit

class ViewController: UITableViewController {
    
    // MARK: properties
    var namesArr = ["Christopher Nolan", "Woody Allen", "David Fincher", "Denis Villenueve", "Jordan Peele"]
    var numbersArr = ["4353444567", "6847697857", "6849673725", "193875729", "5930586047"]
    
    // MARK: class objects
    var contactsCrud = ContactCRUD.contactCRUD
    var alertActions = AlertActions()
    
    // MARK: lifecycle functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem
            .rightBarButtonItem =
        UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewContact))
        
        generateDummyData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    func generateDummyData() {
        for i in 0..<namesArr.count {
            contactsCrud.addContact(name: namesArr[i], number: numbersArr[i])
        }
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
            
                if number != "" {
                    name = "Unknown"
                }
                
                self.contactsCrud
                    .addContact(name: name!, number: number!)
                
                self.tableView
                    .reloadData()
        }))
        
        present(alertController, animated: true)
    }
}

// MARK: ViewController extension for tableView functions
extension ViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactsCrud.contactObjectsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Contact", for: indexPath)
        
        cell.textLabel?
            .text = contactsCrud.contactObjectsArray[indexPath.item].name
        cell.imageView?
            .image = UIImage(systemName: "person")
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contact = contactsCrud.contactObjectsArray[indexPath.row]
        performSegue(withIdentifier: "ViewContact", sender: contact)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        if editingStyle == .delete {
            
            let ac = UIAlertController(title: "Are You Sure?", message: nil, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Cancel", style: .default))
            ac.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { UIAlertAction in
                self.contactsCrud.contactObjectsArray.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }))
            
            present(ac, animated: true)
        }
    }
    
    // MARK: navigate to next view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationViewController = segue.destination as! ContactDetailVC
        destinationViewController.contact = sender as? Contacts
    }
}

