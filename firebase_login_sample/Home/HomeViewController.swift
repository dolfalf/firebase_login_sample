//
//  HomeViewController.swift
//  firebase_login_sample
//
//  Created by jaeeun on 2020/07/12.
//  Copyright © 2020 archive-asia. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

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
    
    //https://firebase.google.com/docs/firestore/quickstart#set_up_your_development_environment
    
    @IBAction func addSampleData(sender: UIButton) {
        
        // TODO: DB関連悪説はRepository化する必要がある
        
        let db = Firestore.firestore()
        
        let random = Int(arc4random()) % 1000
        
        var ref: DocumentReference? = nil
        ref = db.collection("users").addDocument(data: [
            "first": "さとみ\(random)",
            "last": "石原",
            "gender": "Femele",
            "num": random
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
    
    @IBAction func readSampleData(sender: UIButton) {
        
        let db = Firestore.firestore()
        
        db.collection("users").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                }
            }
        }
    }
    
    
}

