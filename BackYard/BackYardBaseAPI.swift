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
    static let sharedInstance = BackYardBaseAPI()
    static var rootDB: DatabaseReference! = Database.database().reference()
}
