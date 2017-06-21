//
//  HomeViewController.swift
//  BackYard
//
//  Created by icbrahimc on 6/18/17.
//  Copyright © 2017 BackYard. All rights reserved.
//

import FirebaseAuth
import LBTAComponents
import UIKit

class HomeViewController: DatasourceController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
        view.backgroundColor = .white
        
        let userDataSource = UserDataSource()
        self.datasource = userDataSource
        
        let handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if let user = user {
                self.navigationItem.prompt = user.displayName
                
            }
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
