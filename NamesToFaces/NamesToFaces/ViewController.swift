//
//  ViewController.swift
//  NamesToFaces
//
//  Created by Nitin on 2/20/23.
//

import UIKit

class ViewController: UICollectionViewController,
                      UIImagePickerControllerDelegate,
                      UINavigationControllerDelegate{

    var people = [Person]()
    
    @objc func addNewPerson() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        
        let imageName = UUID().uuidString
        let imagePath = getDocumentsDirectory().appendingPathComponent(imageName)
        
        if let jpegData = image.jpegData(compressionQuality: 0.8) {
            try? jpegData.write(to: imagePath)
        }
        
        let person = Person(name: "Unknown", image: imageName)
        people.append(person)
        collectionView.reloadData()
        
        dismiss(animated: true)
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem =
        UIBarButtonItem(barButtonSystemItem: .add,
                        target: self,
                        action: #selector(addNewPerson))
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return people.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Person", for: indexPath) as? PersonCell else {
            fatalError("Unable to dequeue PersonCell.")
        }
        
        let person = people[indexPath.item]
        
        cell.label.text = person.name
        
        let path = getDocumentsDirectory().appendingPathComponent(person.image)
        cell.imageView.image = UIImage(contentsOfFile: path.path)
        
        cell.imageView.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        cell.imageView.layer.borderWidth = 1
        cell.imageView.layer.cornerRadius = 10
        cell.layer.cornerRadius = 10
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let person = people[indexPath.item]
        
        let ac = UIAlertController(title: "What would you like to do?", message: nil, preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { action in
            self.people.remove(at: indexPath.item)
            self.collectionView.reloadData()
        }))
        ac.addAction(UIAlertAction(title: "Rename", style: .default, handler: { action in
            self.renamePerson(action: action, person: person)
        }))
        
        present(ac, animated: true)
    }
    
    func renamePerson(action: UIAlertAction, person: Person) {
        let ac = UIAlertController(title: "Rename Person", message: nil, preferredStyle: .alert)
        
        ac.addTextField()
        
        ac.textFields?[0].text = person.name
        
        ac.addAction(UIAlertAction(title: "OK", style: .default) {
            [weak self, weak ac] _ in
            guard let newName = ac?.textFields?[0].text else { return }
            person.name = newName
            self?.collectionView.reloadData()
        })
        
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        present(ac, animated: true)
    }
}

