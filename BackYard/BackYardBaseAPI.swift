//
//  BackYardBaseAPI.swift
//  BackYard
//
//  Created by icbrahimc on 7/13/17.
//  Copyright © 2017 BackYard. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseDatabase
import SwiftyJSON

class BackYardBaseAPI: NSObject {
    static let backyardAPI = BackYardBaseAPI()
    private let rootDB: DatabaseReference! = Database.database().reference()
    
    /**
     Authenticate the user with credentials.
    */
    func authenticateUser(credentials: AuthCredential) {
        let auth = Auth.auth().signIn(with: credentials, completion: { (user, error) in
            if let err = error {
                print(err.localizedDescription)
            }
        })
    }
    
    /**
      Create user with user details.
    */
    func createNewUser(_ uuid: String, data: JSON) {
        let firstName: String = data["first_name"].stringValue
        let lastName: String = data["last_name"].stringValue
        let imageURL: String = data["picture"]["data"]["url"].stringValue
        let email: String = data["email"].stringValue
        
        let dataDictionary = [
            "first_name": firstName,
            "last_name": lastName,
            "imageURL": imageURL,
            "email": email,
        ]
        
        rootDB.child("userDB").child(uuid).setValue(dataDictionary, withCompletionBlock: { (err, ref) in
            if let error = err {
                print(error.localizedDescription)
            }
        })
    }
    
    /**
     Given a user's UUID, fetch the data associated with that user.
    */
    func getUserData(_ uuid: String, callback: @escaping (String, String, String, String, String) -> ()) {
        rootDB.child("userDB").child(uuid).observe(.value, with: { (snapshot) in
            if let dictionary = snapshot.value as? [String : Any] {
                let firstName = dictionary["firstName"] as? String ?? "",
                    lastName = dictionary["lastName"] as? String ?? "",
                    imageURL = dictionary["imageURL"] as? String ?? "",
                    email = dictionary["email"] as? String ?? "",
                    username = dictionary["username"] as? String ?? ""
                callback((firstName, lastName, imageURL, email, username))
            }
        })
    }
}
