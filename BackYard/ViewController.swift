//
//  ViewController.swift
//  BackYard
//
//  Created by icbrahimc on 6/13/17.
//  Copyright © 2017 BackYard. All rights reserved.
//

import FBSDKCoreKit
import FBSDKLoginKit
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newView = UIView(frame: UIScreen.main.bounds)
        newView.backgroundColor = UIColor.red
        self.view.addSubview(newView)
        
        let loginButton: FBSDKLoginButton = FBSDKLoginButton()
        loginButton.center = self.view.center
        
        view.addSubview(loginButton)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

