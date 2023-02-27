//
//  NotificationMainViewController.swift
//  PassingDataBetweenVCs
//
//  Created by Himanshu on 2/27/23.
//

import UIKit

class NotificationMainViewController: UIViewController {
    
    static let myNotification = Notification.Name("start game")

    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(onNotification(notification:)), name: NotificationMainViewController.myNotification, object: nil)
    }
    
    @objc func onNotification(notification: Notification) {
        print("the game will start")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
