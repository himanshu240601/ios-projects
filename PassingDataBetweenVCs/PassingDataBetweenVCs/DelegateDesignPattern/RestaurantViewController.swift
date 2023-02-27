//
//  RestaurantViewController.swift
//  PassingDataBetweenVCs
//
//  Created by Himanshu on 2/27/23.
//

import UIKit

class RestaurantViewController: UIViewController, JuiceDelegate {

    //the label that informs the clients choice
        @IBOutlet weak var juiceFlavorLabel: UILabel!
      
        @IBAction func didPressOrderJuiceButton(_ sender: Any) {
            
            if let vc = storyboard?.instantiateViewController(withIdentifier: "Juice") as? JuiceViewController {
              //informs the Juice ViewController that the restaurant is the delegate
                vc.delegate = self
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
        
        //this method is called when we choose the flavour on the other ViewController
        func flavorWasChosen(_ flavor: String) {
            juiceFlavorLabel.text = "Here is your " + flavor + " juice!"
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
