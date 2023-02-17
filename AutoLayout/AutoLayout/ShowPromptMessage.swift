//
//  ShowPromptMessage.swift
//  AutoLayout
//
//  Created by Himanshu on 2/16/23.
//

import Foundation
import UIKit

class ShowPromptMessage {
    
    func getPromptAction (title: String, message: String, action: String) -> UIAlertController {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: action, style: .default))
        
        return ac
    }
    
}
