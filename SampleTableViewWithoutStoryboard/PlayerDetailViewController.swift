//
//  PlayerDetailViewController.swift
//  SampleTableViewWithoutStoryboard
//
//  Created by 渕一真 on 2021/02/03.
//

import UIKit

class PlayerDetailViewController: UIViewController {
    
    var player: Player? {
        didSet {
            playerImageView.image = player?.image
            nameLabel.text = player?.name
        }
    }
    
    let playerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .blue
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 35)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let generationTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Genetation:"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 30)
        return label
    }()
    
    let generationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .right
        label.font = .boldSystemFont(ofSize: 40)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(playerImageView)
        view.addSubview(nameLabel)
        
        [
            playerImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            playerImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            playerImageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            playerImageView.heightAnchor.constraint(equalToConstant: view.frame.width),
            
            
            nameLabel.rightAnchor.constraint(equalTo: playerImageView.rightAnchor, constant: -15),
            nameLabel.bottomAnchor.constraint(equalTo: playerImageView.bottomAnchor, constant: -15)
        ].forEach { $0.isActive = true }
        
        let generationStackView = UIStackView(arrangedSubviews: [generationTitleLabel, generationLabel])
        
        generationStackView.axis = .horizontal
        generationStackView.spacing = 0
        generationStackView.distribution = .fillEqually
        
        
        
        generationStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(generationStackView)
        
        [
            generationStackView.topAnchor.constraint(equalTo: playerImageView.bottomAnchor, constant: 60),
            generationStackView.leftAnchor.constraint(equalTo: playerImageView.leftAnchor, constant: 10),
            generationStackView.rightAnchor.constraint(equalTo: playerImageView.rightAnchor, constant: 10)
        ].forEach{ $0.isActive = true }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "Detail"
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.prefersLargeTitles = false
    }
}
