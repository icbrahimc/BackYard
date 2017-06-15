//
//  ViewController.swift
//  BackYard
//
//  Created by icbrahimc on 6/13/17.
//  Copyright © 2017 BackYard. All rights reserved.
//

import FirebaseAuth
import FBSDKCoreKit
import FBSDKLoginKit
import UIKit

class ViewController: UIViewController, FBSDKLoginButtonDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setup() -> Void {
        // Setup the login button.
        let loginButtonFrame = CGRect(x: 0, y: 0, width: view.frame.width - 32, height: 50);
        let loginButton: FBSDKLoginButton = FBSDKLoginButton(frame: loginButtonFrame)
        loginButton.center = self.view.center
        loginButton.delegate = self
        
        view.addSubview(loginButton)
        
        self.view.backgroundColor = .white
    }

    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if let error = error {
            print(error.localizedDescription)
            return
        }
        
        // Get the access token and authenticate.
        let accessToken = FBSDKAccessToken.current()
        guard let accessTokenString = accessToken?.tokenString else {
            return
        }
        
        let credential = FacebookAuthProvider.credential(withAccessToken: accessTokenString)
        Auth.auth().signIn(with: credential) { (user, error) in
            // ...
            if let error = error {
                print(error.localizedDescription)
                return
            }
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
    }
    

}

