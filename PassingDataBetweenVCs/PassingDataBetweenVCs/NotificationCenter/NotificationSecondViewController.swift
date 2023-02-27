//
//  NotificationSecondViewController.swift
//  PassingDataBetweenVCs
//
//  Created by Himanshu on 2/27/23.
//

import UIKit

class NotificationSecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        sendNotification()
    }
    
    func sendNotification() {
        NotificationCenter.default.post(name: NotificationMainViewController.myNotification, object: nil)
    }

}
