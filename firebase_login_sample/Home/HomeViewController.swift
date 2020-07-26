//
//  HomeViewController.swift
//  firebase_login_sample
//
//  Created by jaeeun on 2020/07/12.
//  Copyright © 2020 archive-asia. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func logOutAction(sender: AnyObject) {
        
        do {
            try Auth.auth().signOut()
            
            let vc = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "LoginVC")
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
            
        } catch  {
            //exception
        }
    }
}

