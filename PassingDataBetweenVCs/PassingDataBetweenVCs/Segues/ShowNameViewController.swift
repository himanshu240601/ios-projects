//
//  ShowNameViewController.swift
//  PassingDataBetweenVCs
//
//  Created by Himanshu on 2/27/23.
//

import UIKit

class ShowNameViewController: UIViewController {

    @IBOutlet weak var textFieldWelcome: UITextField!
    
    var nickname: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldWelcome.text = "Hi \(nickname!)! How you doin'"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
