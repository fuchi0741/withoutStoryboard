//
//  MainTableViewCell.swift
//  SampleTableViewWithoutStoryboard
//
//  Created by 渕一真 on 2021/02/03.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    let playerImageViewSize: CGFloat = 50
    
    let playerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .blue
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "ここに名前が入ります"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(playerImageView)
        addSubview(nameLabel)
        
        //AutoLayoutをコードで書いてみた
        [
            playerImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            playerImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            playerImageView.widthAnchor.constraint(equalToConstant: playerImageViewSize),
            playerImageView.heightAnchor.constraint(equalToConstant: playerImageViewSize),
            
            nameLabel.leftAnchor.constraint(equalTo: playerImageView.rightAnchor, constant: 20),
            nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ].forEach { $0.isActive = true }
        playerImageView.layer.cornerRadius = playerImageViewSize / 2
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
