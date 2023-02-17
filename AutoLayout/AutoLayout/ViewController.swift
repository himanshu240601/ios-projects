//
//  ViewController.swift
//  AutoLayout
//
//  Created by Himanshu on 2/15/23.
//

import UIKit

class ViewController: UIViewController {
    
//    #warning("use proper names for outlets.")
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let showPromptMessage = ShowPromptMessage()
    
    let setElementsPadding = Padding()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set padding for passwordTextField
        setElementsPadding
            .setPaddingToRightOfTextFields(
                textField: passwordTextField,
                x: 0, y: 0,
                width: 34,
                height: self.passwordTextField.frame.height
            )
    }

    //open dialog to prompt user
    //to enter email and receive a
    //verification code for password recovery
    @IBAction func forgotPasswordTapped(_ sender: UIButton) {
        let alertControllerForgotPassword =
        showPromptMessage.getPromptAction(title: "Forgot Password?", message: "Enter Your Email to Get a Verification Code.", action: "Done")
        
        //add textField to get email address from user
        alertControllerForgotPassword
            .addTextField()
        
        present(alertControllerForgotPassword, animated: true)
    }
    
    //show prompt message on invalid/wrong input in textfields
    func showErrorMessage(message: String) -> Bool {
        let alertControllerInvalidInput =
        showPromptMessage.getPromptAction(title: "Invalid Input!", message: message, action: "OK")
        
        present(alertControllerInvalidInput, animated: true)
        
        return false
    }
    
//    #warning("reusability problem. Methods should be different for each and every type of validation. Eg. here you have two type of validations password and email. Their methods should be different and should be in different files so that any other classes can use it too.")
    
    let emailValidation = EmailValidation()
    let passwordValidation = PasswordValidation()
    
    func validateUserInput(email: String, password: String) -> Bool {
        
        //isEmailValid stores two results (Bool, String)
        //isEmailValid.0 is whether the email entered is correct (a bool value)
        //isEmailValid.1 is message to show on prompt (a string value)
        let isEmailValid = emailValidation.isValidEmail(emailID: email)
        if !isEmailValid.0 {
            return showErrorMessage(message: isEmailValid.1)
        }
        
        //isPasswordValid stores two results (Bool, String)
        //isPasswordValid.0 is whether the password is correct (a bool value)
        //isPasswordValid.1 is message to show on prompt (a string value)
        let isPasswordValid = passwordValidation.isValidPassword(password: password)
        if !isPasswordValid.0 {
            return showErrorMessage(message: isPasswordValid.1)
        }
        
        return true
    }
    
    @IBAction func loggedInTapped(_ sender: UIButton) {
        
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        //validate email and password
        if validateUserInput(email: email, password: password) {
            
            //clear textFields
            emailTextField.text?.removeAll()
            passwordTextField.text?.removeAll()
            
            //go to next viewController
            performSegue(withIdentifier: "LoginSuccess", sender: nil)
            
//            guard let navigationController = self.navigationController else {
//                return
//            }
//            var navigationArray = navigationController.viewControllers
//            navigationArray.remove(at: navigationArray.count-2)
//            
//            self.navigationController?.viewControllers = navigationArray
        }
    }
    
    @IBOutlet weak var toggleButton: UIButton!
    //toggle password - visible or secure
    @IBAction func togglePasswordTapped(_ sender: UIButton) {
        if passwordTextField.isSecureTextEntry{
            //change to readable text
            toggleButton.setImage(UIImage(systemName: "eye.circle.fill"), for: .normal)
            passwordTextField.isSecureTextEntry = false
        }else {
            //change to secure text
            toggleButton.setImage(UIImage(systemName: "eye.slash.circle.fill"), for: .normal)
            passwordTextField.isSecureTextEntry = true
        }
    }
}
