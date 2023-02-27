//
//  ViewController.swift
//  PassingDataBetweenVCs
//
//  Created by Himanshu on 2/27/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "onboarding", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? ShowNameViewController else {
            return
        }
        
        destinationVC.nickname = textField.text
        
    }

}

