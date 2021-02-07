//
//  MainTableViewController.swift
//  SampleTableViewWithoutStoryboard
//
//  Created by 渕一真 on 2021/02/02.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    private let cellID = "cellID"
    
    private let players: [[Player]] = [
        [.init(name: "イビチャオシム", image: #imageLiteral(resourceName: "スクリーンショット 2021-02-03 19.21.10")),
         .init(name: "アマルオシム", image: #imageLiteral(resourceName: "スクリーンショット 2021-02-03 19.21.29")),
         .init(name: "クゼ", image: #imageLiteral(resourceName: "スクリーンショット 2021-02-03 19.22.12")),
         .init(name: "アレックスミラー", image: #imageLiteral(resourceName: "スクリーンショット 2021-02-03 19.22.27")),
         .init(name: "江尻", image: #imageLiteral(resourceName: "スクリーンショット 2021-02-03 19.22.44")),
        ],
        
        [.init(name: "ドワイト", image: #imageLiteral(resourceName: "スクリーンショット 2021-02-03 19.22.58")),
         .init(name: "木山", image: #imageLiteral(resourceName: "スクリーンショット 2021-02-03 20.45.00")),
         .init(name: "鈴木淳", image: #imageLiteral(resourceName: "スクリーンショット 2021-02-03 19.23.10")),
         .init(name: "関塚", image: #imageLiteral(resourceName: "スクリーンショット 2021-02-03 19.23.30")),
         .init(name: "エスナイデル", image: #imageLiteral(resourceName: "スクリーンショット 2021-02-03 19.23.52")),
         .init(name: "江尻", image: #imageLiteral(resourceName: "スクリーンショット 2021-02-03 19.22.44")),
        ],
        
        [.init(name: "尹晶煥", image: #imageLiteral(resourceName: "スクリーンショット 2021-02-03 19.24.13"))
        ]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: cellID)
        
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "ジェフ歴代監督"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // nvigationbarの背景色を変更
        let appearance = UINavigationBarAppearance()
        appearance.configureWithDefaultBackground() // この設定は必要ないのでは？
        appearance.backgroundColor = #colorLiteral(red: 0, green: 0.831271112, blue: 0.2257555723, alpha: 1)
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.standardAppearance = appearance
    }
}

/// MARK: - Table周りの設定
extension MainTableViewController {
    /// セクションの数
    override func numberOfSections(in tableView: UITableView) -> Int {
        return players.count
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.textAlignment = .center
        label.backgroundColor = .gray
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .white
        
        switch section {
        case 0:
            label.text = "2000s"
        case 1:
            label.text = "2010s"
        case 2:
            label.text = "2020s"
        default: break
        }
    
        return label
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! MainTableViewCell
        
        let player = players[indexPath.section][indexPath.row] // 命名がわかりやすい
        cell.nameLabel.text = player.name
        cell.playerImageView.image = player.image
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = PlayerDetailViewController()
        vc.player = players[indexPath.section][indexPath.row]
        
        var genetation = "2000s"
        if indexPath.section == 1 {
            genetation = "2010s"
        } else if indexPath.section == 2 {
            genetation = "2020s"
        }
        
        vc.generationLabel.text = genetation
        navigationController?.pushViewController(vc, animated: true)
    }
}

/// Modelクラス
class Player {
    
    let name: String
    let image: UIImage
    
    init(name: String, image: UIImage) {
        self.name = name
        self.image = image
    }
}
