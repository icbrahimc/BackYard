//
//  SettingsViewController.swift
//  BackYard
//
//  Created by icbrahimc on 6/25/17.
//  Copyright © 2017 BackYard. All rights reserved.
//

import FirebaseAuth
import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        self.navigationItem.hidesBackButton = true
        navigationItem.title = "Settings"
        
        setup()
        // Do any additional setup after loading the view.
    }
    
    func setup() -> Void {
        // LogOut Button Setup
        let logOutButtonFrame =
            CGRect(x: 0.0, y: 0.0, width: view.frame.width - 32, height: 50)
        let logOutButton = UIButton(type: .system)
        logOutButton.frame = logOutButtonFrame
        logOutButton.setTitle("Log Out", for: .normal)
        logOutButton.setTitleColor(.white, for: .normal)
        logOutButton.backgroundColor = .black
        logOutButton.layer.cornerRadius = 25.0
        logOutButton.layer.masksToBounds = true
        logOutButton.center = self.view.center
        
        logOutButton.addTarget(self, action: #selector(logOut), for: .touchUpInside)
        view.addSubview(logOutButton)
    }
    
    func logOut() {
        let firebaseAuth = Auth.auth()
        
        do {
            try firebaseAuth.signOut()
            navigationController?.popToRootViewController(animated: true)
            print("Logged Out Successfully")
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
    }
}
