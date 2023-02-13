//
//  ColorsDetailVC.swift
//  RandomColorGenerator
//
//  Created by Himanshu on 2/13/23.
//

import UIKit

class ColorsDetailVC: UIViewController {

    var color: UIColor?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = color ?? .white
    }

}
