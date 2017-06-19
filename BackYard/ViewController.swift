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

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }


    override func viewWillAppear(_ animated: Bool) {
        let handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if let _ = user {
                print("user is already authenicated")
                let homeController = HomeViewController()
                self.navigationController?.pushViewController(homeController, animated: true)
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setup()
    }
    
    func setup() -> Void {
        // Setup the view controller.
        self.navigationController?.isNavigationBarHidden = true
        // Offsets for the screen.
//        let offsetX: CGFloat = UIScreen.main.bounds.maxX
        let offsetY: CGFloat = UIScreen.main.bounds.maxY
        
        // Setup the login button.
        let loginButtonFrame = CGRect(x: 0, y: offsetY * 0.5
            , width: view.frame.width - 32, height: 50)
        
        // Custom Facebook login.
        let fbLogin = UIButton(type: .system)
        fbLogin.frame = loginButtonFrame
        fbLogin.setTitle("Log In With Facebook", for: .normal)
        fbLogin.setTitleColor(.white, for: .normal)
        fbLogin.backgroundColor = .blue
        fbLogin.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        fbLogin.layer.cornerRadius = 25.0
        fbLogin.layer.masksToBounds = true
        fbLogin.center.x = self.view.center.x
        
        fbLogin.addTarget(self, action: #selector(handleFaceBookLogin), for: .touchUpInside)
        view.addSubview(fbLogin)
        
        // Setup logo image in the code.
        let logoImageFrame = CGRect(x: 0, y: offsetY * 0.3, width: view.frame.width - 32, height: 50)
        let logoImage = UIImage(named: "backYard")
        let logoImageView = UIImageView(image: logoImage)
        logoImageView.frame = logoImageFrame
        logoImageView.center.x = self.view.center.x
        
        view.addSubview(logoImageView)
        
        
        self.view.backgroundColor = .white
    }

    /** Facebook Auth */
    func handleFaceBookLogin() {
        FBSDKLoginManager().logIn(withReadPermissions: ["email", "public_profile"], from: self, handler: {
            (result, err) in
            if let error = err {
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
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                // If the user is signed in and authenticated, segue to a new view controller.
                if let _ = user {
                    let homeController = HomeViewController()
                    self.navigationController?.pushViewController(homeController, animated: true)
                }
            }
        })
    }
}

