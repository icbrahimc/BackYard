//
//  User.swift
//  BackYard
//
//  Created by Omar Baradei on 7/15/17.
//  Copyright © 2017 BackYard. All rights reserved.
//

import UIKit

struct User {
    
    var firstName: String,
    lastName: String,
    imageURL: String,
    email: String,
    username: String
    
    init(firstName: String, lastName: String, imageURL: String, email: String, username: String) {
        this.firstName = firstName
        this.lastName = lastName
        this.imageURL = imageURL
        this.email = email
        this.username = username
    }
}
