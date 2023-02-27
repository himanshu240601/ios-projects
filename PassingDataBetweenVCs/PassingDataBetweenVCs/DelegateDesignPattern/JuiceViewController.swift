//
//  JuiceViewController.swift
//  PassingDataBetweenVCs
//
//  Created by Himanshu on 2/27/23.
//

import UIKit

class JuiceViewController: UIViewController {

    weak var delegate: JuiceDelegate?
    
    @IBAction func didTappedFlavorButton(_ sender: UIButton) {
        let flavor = sender.titleLabel?.text ?? "flavor"
        
        delegate?.flavorWasChosen(flavor)
        
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
