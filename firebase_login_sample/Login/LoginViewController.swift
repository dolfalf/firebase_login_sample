//
//  LoginViewController.swift
//  firebase_login_sample
//
//  Created by jaeeun on 2020/07/12.
//  Copyright © 2020 archive-asia. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
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

    //Login Action
    @IBAction func loginAction(_ sender: AnyObject) {
        
        if self.emailTextField.text == "" || self.passwordTextField.text == "" {
            
            //Alert to tell the user that there was an error because they didn't fill anything in the textfields because they didn't fill anything in
            
            let alertController = UIAlertController(title: "Error", message: "Please enter an email and password.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
        
        } else {
            
            guard let email = emailTextField.text else  {
                return
            }
            guard let password = passwordTextField.text else {
                return
            }
            
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                
                if error != nil {
                    print("error : \(error.debugDescription)")
                    return
                }
                
              guard let strongSelf = self else { return }
              
                let storyboard = UIStoryboard(name: "Home", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "HomeVC")
                vc.modalPresentationStyle = .fullScreen
                strongSelf.present(vc, animated: true, completion: nil)
                
            }
            
            
            
        }
    }

}
