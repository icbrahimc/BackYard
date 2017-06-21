//
//  Cells.swift
//  BackYard
//
//  Created by icbrahimc on 6/20/17.
//  Copyright © 2017 BackYard. All rights reserved.
//

import LBTAComponents

class UserDataSource: Datasource {
    let words = ["user", "hey", "world"]
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return words[indexPath.item]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return words.count
    }
}
