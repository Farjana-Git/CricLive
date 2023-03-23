//
//  UpcomingMatchesTVC.swift
//  CricLive
//
//  Created by Bjit on 14/2/23.
//

import UIKit

class UpcomingMatchesVC: UIViewController {
    
    @IBOutlet weak var tableViewForUpcomingMatches: UITableView!
    
    var upcomingMatchesArray: Upcoming?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewForUpcomingMatches.delegate = self
        tableViewForUpcomingMatches.dataSource = self

        fetchDataForUpcoming()
        
    }
    
    func fetchDataForUpcoming() {
        APICallerForUpcomigMatches.shared.fetchData { [weak self] data in
            dump(data)
            self?.upcomingMatchesArray = data
            DispatchQueue.main.async {
                self?.tableViewForUpcomingMatches.reloadData()
            }
        }
    }
}

extension UpcomingMatchesVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

}

extension UpcomingMatchesVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return upcomingMatchesArray?.data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tableViewCellForUpcomingMatches = tableViewForUpcomingMatches.dequeueReusableCell(withIdentifier: "upcomingMatchCellIdentifier", for: indexPath) as! UpcomingMatchesTVCell
        
        tableViewCellForUpcomingMatches.gameTypeLabel.text = upcomingMatchesArray?.data?[indexPath.row].type
        

        tableViewCellForUpcomingMatches.localTeamNameLabel.text = upcomingMatchesArray?.data?[indexPath.row].localteam?.name

        tableViewCellForUpcomingMatches.visitorTeamNameLabel.text = upcomingMatchesArray?.data?[indexPath.row].visitorteam?.name

        tableViewCellForUpcomingMatches.localTeamImgView.sd_setImage(with: URL(string: upcomingMatchesArray?.data?[indexPath.row].localteam?.image_path ?? ""), completed: nil)

        tableViewCellForUpcomingMatches.visitorTeamImgView.sd_setImage(with: URL(string: upcomingMatchesArray?.data?[indexPath.row].visitorteam?.image_path ?? ""), completed: nil)

        tableViewCellForUpcomingMatches.venueLabel.text = upcomingMatchesArray?.data?[indexPath.row].venue?.name ?? "Awaiting venue confirmation"
        
        
        return tableViewCellForUpcomingMatches
    }
    
}

// hi
