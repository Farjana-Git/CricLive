//
//  PlayerInfoVC.swift
//  CricLive
//
//  Created by Bjit on 21/2/23.
//

import UIKit

class PlayerInfoVC: UIViewController {

    @IBOutlet weak var imgBackgroundView: UIView!
    var playerId: Int?

    @IBOutlet weak var playerImgView: UIImageView!
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var playerCountryLabel: UILabel!
    
    
    @IBOutlet weak var tableViewForPlayerInfo: UITableView!
    
    var passedPlayerInfoArray: PlayerInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let playerId = playerId else {
            return
        }

        APICallerForPlayerInfo.shared.fetchData(playerID: playerId) { [weak self] data in
            self?.passedPlayerInfoArray = data

            DispatchQueue.main.async {
                self?.playerNameLabel.text = self?.passedPlayerInfoArray?.data?.fullname
                self?.playerCountryLabel.text = self?.passedPlayerInfoArray?.data?.country?.name
                
                self?.playerImgView.sd_setImage(with: URL(string: self?.passedPlayerInfoArray?.data?.image_path ?? ""), completed: nil)
                
                self?.tableViewForPlayerInfo.reloadData()
            }
        }
        
        tableViewForPlayerInfo.delegate = self
        tableViewForPlayerInfo.dataSource = self
        
        
        playerImgView.layer.cornerRadius = 60
        playerImgView.layer.masksToBounds = true

        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToCareer",
            let destinationCareerVC = segue.destination as? StatisticsVC {
            destinationCareerVC.playerId = passedPlayerInfoArray?.data?.id

        }

    }
    
    
    @IBAction func goToCareer(_ sender: Any) {
        performSegue(withIdentifier: "goToCareer", sender: nil)
    }
    

}

extension PlayerInfoVC: UITableViewDelegate {
    
}


extension PlayerInfoVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tableViewCellForPlayerInfo = tableViewForPlayerInfo.dequeueReusableCell(withIdentifier: "playerInfoCellIdentifier", for: indexPath) as! PlayerInfoTVCell
        
        tableViewCellForPlayerInfo.bornLabel.text = "Born"
        tableViewCellForPlayerInfo.bornDescLabel.text = passedPlayerInfoArray?.data?.dateofbirth ?? "-"
        
        tableViewCellForPlayerInfo.battingStyleLabel.text = "Batting Style"
        tableViewCellForPlayerInfo.battingStyleDescLabel.text = passedPlayerInfoArray?.data?.battingstyle ?? "-"
        
        tableViewCellForPlayerInfo.bowlingStyleLabel.text = "Bowling Style"
        tableViewCellForPlayerInfo.bowlingStyleDescLabel.text = passedPlayerInfoArray?.data?.bowlingstyle ?? "-"
        
        tableViewCellForPlayerInfo.roleLabel.text = "Role"
        tableViewCellForPlayerInfo.roleDescLabel.text = passedPlayerInfoArray?.data?.position?.name ?? "-"
        
        return tableViewCellForPlayerInfo
    }
    
    
}
