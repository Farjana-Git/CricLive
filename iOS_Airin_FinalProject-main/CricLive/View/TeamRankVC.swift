//
//  TeamRankVC.swift
//  CricLive
//
//  Created by Bjit on 21/2/23.
//

import UIKit

class TeamRankVC: UIViewController {
    
    @IBOutlet weak var tableViewForTeamRank: UITableView!

    
   
    var teamRankDataArray: Teams?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewForTeamRank.delegate = self
        tableViewForTeamRank.dataSource = self

        teamRankForT20()

    }
    
    func teamRankForT20() {
        APICallerForT20.shared.fetchData(type: "T20") { [weak self] data in
            dump(data)
            self?.teamRankDataArray = data
            DispatchQueue.main.async {
                self?.tableViewForTeamRank.reloadData()
            }
        }
    }
    
    @IBAction func goToT20(_ sender: Any) {
        
        APICallerForT20.shared.fetchData(type: "T20") { [weak self] data in
            dump(data)
            self?.teamRankDataArray = data
            DispatchQueue.main.async {
                self?.tableViewForTeamRank.reloadData()
            }
        }
    }
    
    
    @IBAction func goToODI(_ sender: Any) {
        
        APICallerForT20.shared.fetchData(type: "ODI") { [weak self] data in
            dump(data)
            self?.teamRankDataArray = data
            DispatchQueue.main.async {
                self?.tableViewForTeamRank.reloadData()
            }
        }

    }
    
    
    
    @IBAction func goToTest(_ sender: Any) {
        
        APICallerForT20.shared.fetchData(type: "Test") { [weak self] data in
            dump(data)
            self?.teamRankDataArray = data
            DispatchQueue.main.async {
                self?.tableViewForTeamRank.reloadData()
            }
        }
    }
    
}


extension TeamRankVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
    }
    
}

extension TeamRankVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamRankDataArray?.data?[0].team?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let tableViewCellForTeamRank = tableViewForTeamRank.dequeueReusableCell(withIdentifier: "teamRankCellIndentifier", for: indexPath) as! TeamRankTVCell
        

        tableViewCellForTeamRank.typeLabel.text = teamRankDataArray?.data?[0].type
        
        tableViewCellForTeamRank.teamLogoImgView.sd_setImage(with: URL(string: teamRankDataArray?.data?[0].team?[indexPath.row].image_path ?? ""), completed: nil)
        
        tableViewCellForTeamRank.countryNameLabel.text = teamRankDataArray?.data?[0].team?[indexPath.row].name
        
        tableViewCellForTeamRank.positionDescLabel.text = String(teamRankDataArray?.data?[0].team?[indexPath.row].ranking?.position ?? 0)
        
        tableViewCellForTeamRank.matchesLabel.text = "Matches"
        tableViewCellForTeamRank.matchesDescLabel.text = String(teamRankDataArray?.data?[0].team?[indexPath.row].ranking?.matches ?? 0)
        
        tableViewCellForTeamRank.pointsLabel.text = "Points"
        tableViewCellForTeamRank.pointsDescLabel.text = String(teamRankDataArray?.data?[0].team?[indexPath.row].ranking?.points ?? 0)
        
        tableViewCellForTeamRank.ratingLabel.text = "Rating"
        tableViewCellForTeamRank.ratingDescLabel.text = String(teamRankDataArray?.data?[0].team?[indexPath.row].ranking?.rating ?? 0)
        

        
        return tableViewCellForTeamRank
    }


}
