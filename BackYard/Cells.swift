//
//  Cells.swift
//  BackYard
//
//  Created by icbrahimc on 6/20/17.
//  Copyright © 2017 BackYard. All rights reserved.
//

import LBTAComponents

class UserHeader: DatasourceCell {
    override func setupViews() {
        super.setupViews()
        backgroundColor = .green
    }
}

class UserCell: DatasourceCell {
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        let profileImage: UIImage = #imageLiteral(resourceName: "ibrahim")
        
        imageView.image = profileImage
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Ibrahim Conteh"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    let occupationLabel: UILabel = {
        let label = UILabel()
        label.text = "iOS Developer"
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()
    
    let networkLabel: UILabel = {
        let label = UILabel()
        label.text = "@Morehouse College"
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = .white
        
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor.black
        
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(occupationLabel)
        addSubview(networkLabel)
        
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 60, heightConstant: 60)
        
        nameLabel.anchor(self.topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: self.rightAnchor, topConstant: 8, leftConstant: 8, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 20)
        
        occupationLabel.anchor(nameLabel.bottomAnchor, left: profileImageView.rightAnchor, bottom: nil, right: self.rightAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 20)
        
        networkLabel.anchor(occupationLabel.bottomAnchor, left: profileImageView.rightAnchor, bottom: nil, right: self.rightAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 20)
    }
    
}
