//
//  CardSelectionVC.swift
//  CardWorkoutApp
//
//  Created by Himanshu on 2/13/23.
//

import UIKit

class CardSelectionVC: UIViewController {

    @IBOutlet weak var cardLabelView: UILabel!
    
    @IBOutlet var buttons: [UIButton]!
    
    var timer: Timer!
    
    var cards: [String] = Card.allValues
    
    override func viewDidLoad() {
        super.viewDidLoad()

        startTimer()
        
        for button in buttons {
            button.layer.cornerRadius = 8
        }
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
    }
    
    @objc func showRandomImage() {
        cardLabelView.text = cards.randomElement() ?? "A"
    }
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        timer.invalidate()
    }
    
    @IBAction func restartButtonTapped(_ sender: UIButton) {
        timer.invalidate()
        startTimer()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
}
