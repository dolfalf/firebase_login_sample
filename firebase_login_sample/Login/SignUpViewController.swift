//
//  SignUpViewController.swift
//  firebase_login_sample
//
//  Created by jaeeun on 2020/07/12.
//  Copyright © 2020 archive-asia. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {

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
    
    //Sign Up Action for email
    @IBAction func createAccountAction(_ sender: AnyObject) {
        guard let email = emailTextField.text else {
            let alertController = UIAlertController(title: "Error", message: "Please enter your email and password", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: passwordTextField.text ?? "") { authResult, error in
          
            if (error != nil) {
                //6桁以上のパスワードが必要
                return
            }
            
            let vc = self.storyboard!.instantiateViewController(withIdentifier: "LoginVC")
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
            
        }
    }

    @IBAction func showLogin(sender: UIButton) {
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "LoginVC")
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
}
