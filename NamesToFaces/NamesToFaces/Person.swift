//
//  Person.swift
//  NamesToFaces
//
//  Created by Himanshu on 2/20/23.
//

import UIKit

class Person: NSObject {
    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
