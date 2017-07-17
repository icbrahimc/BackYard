//
//  BackYardBaseAPI.swift
//  BackYard
//
//  Created by icbrahimc on 7/13/17.
//  Copyright © 2017 BackYard. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

class BackYardBaseAPI: NSObject {
    static let backyardAPI = BackYardBaseAPI()
    private let rootDB: DatabaseReference! = Database.database().reference()
    
    /**
     Given a user's UUID, fetch the data associated with that user.
    */
    func getUserData(uuid: String, callback: @escaping (String, String, String, String, String) -> ()) {
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
