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

class UserDataSource: Datasource {
    let words = ["user"]
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return words[indexPath.item]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return words.count
    }
}

class HomeViewController: DatasourceController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = false
        self.navigationItem.hidesBackButton = true
        view.backgroundColor = .black
        
        let userDataSource = UserDataSource()
        self.datasource = userDataSource
    }

    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 150)
    }
}
