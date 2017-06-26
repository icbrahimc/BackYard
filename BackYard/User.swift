//
//  User.swift
//  BackYard
//
//  Created by icbrahimc on 6/25/17.
//  Copyright © 2017 BackYard. All rights reserved.
//

import UIKit

// User profile object.
class User: NSObject {
    let name: String
    let email: String
    let id: String
    let profileImageURL: String
    
    init(name: String, email: String, id: String, profileImageURL: String) {
        self.name = name
        self.email = email
        self.id = id
        self.profileImageURL = profileImageURL
    }
}
