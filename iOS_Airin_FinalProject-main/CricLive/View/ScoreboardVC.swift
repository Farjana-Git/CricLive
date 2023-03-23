//
//  ScoreboardVC.swift
//  CricLive
//
//  Created by Bjit on 19/2/23.
//

import UIKit

class ScoreboardVC: UIViewController {
    
    @IBOutlet weak var tableViewForScoreBoard: UITableView!
    
    var scoreboardArray: Scoreboard?
    var fixtureID: Int?
    
    let spaceBetweenSections = 80
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewForScoreBoard.delegate = self
        tableViewForScoreBoard.dataSource = self
        
        APICallerForScoreboard.shared.fetchDataScoreboard(fixtureID: fixtureID ?? 0) { [weak self] data in
            dump(data)
            self?.scoreboardArray = data
            DispatchQueue.main.async {
                self?.tableViewForScoreBoard.reloadData()
            }
        }

    }

}


// MARK: - Extension
extension ScoreboardVC: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55

    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Batting                              R       B        4s      6s         SR"
        } else {
            return "Bowling                             O       M        R       W           ER"
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(spaceBetweenSections/2)
    }
    
}


extension ScoreboardVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return scoreboardArray?.data?.batting?.count ?? 0
        }
        else {
            return scoreboardArray?.data?.bowling?.count ?? 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let tableViewCellForScoreBopard = tableViewForScoreBoard.dequeueReusableCell(withIdentifier: "scoreBoardCellIdentifier", for: indexPath) as! ScoreboardTVCell
            
            tableViewCellForScoreBopard.batterNameLabel.text = scoreboardArray?.data?.batting?[indexPath.row].batsman?.fullname
            
            tableViewCellForScoreBopard.batterRunLabel.text = String(scoreboardArray?.data?.batting?[indexPath.row].score ?? 0)
            
            
            tableViewCellForScoreBopard.batterBowlLabel.text = String(scoreboardArray?.data?.batting?[indexPath.row].ball ?? 0)
            
            tableViewCellForScoreBopard.fourLabel.text = String(scoreboardArray?.data?.batting?[indexPath.row].four_x ?? 0)
            
            tableViewCellForScoreBopard.sixLabel.text = String(scoreboardArray?.data?.batting?[indexPath.row].six_x ?? 0)
            
            tableViewCellForScoreBopard.srLabel.text = String(scoreboardArray?.data?.batting?[indexPath.row].rate ?? 0)
            
            
            
            
            return tableViewCellForScoreBopard
        }
        else {
            let tableViewCellForScoreBopard = tableViewForScoreBoard.dequeueReusableCell(withIdentifier: "scoreBoardCellIdentifier", for: indexPath) as! ScoreboardTVCell
            
            tableViewCellForScoreBopard.batterNameLabel.text = scoreboardArray?.data?.bowling?[indexPath.row].bowler?.fullname
            
            tableViewCellForScoreBopard.batterRunLabel.text = String(scoreboardArray?.data?.bowling?[indexPath.row].overs ?? 0.0)
            
            tableViewCellForScoreBopard.batterBowlLabel.text = String(scoreboardArray?.data?.bowling?[indexPath.row].medians ?? 0)
            
            tableViewCellForScoreBopard.fourLabel.text = String(scoreboardArray?.data?.bowling?[indexPath.row].runs ?? 0)
            
            tableViewCellForScoreBopard.sixLabel.text = String(scoreboardArray?.data?.bowling?[indexPath.row].wickets ?? 0)
            
            tableViewCellForScoreBopard.srLabel.text = String(scoreboardArray?.data?.bowling?[indexPath.row].rate ?? 0)
            
            return tableViewCellForScoreBopard
        }
    }
    
    
}
