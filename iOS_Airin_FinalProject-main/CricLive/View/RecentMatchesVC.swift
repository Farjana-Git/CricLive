//
//  RecentMatchesVC.swift
//  CricLive
//
//  Created by Bjit on 13/2/23.
//

import UIKit
import SDWebImage

class RecentMatchesVC: UIViewController {
    
    @IBOutlet weak var tableViewForRecentMatches: UITableView!
    
    var recentDataArray: CricketData?
    var liveMatchArray: LiveMatch?
    var index: Int?
    
    var arrayOfMatch: [Match] = []   //for detail info
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewForRecentMatches.delegate = self
        tableViewForRecentMatches.dataSource = self
        
        recentMatches()
    }
    
    // MARK: - API caller for recent matches
    func recentMatches() {
        APICaller.shared.fetchData { [weak self] data in
            dump(data)
            self?.recentDataArray = data
            DispatchQueue.main.async {
                self?.tableViewForRecentMatches.reloadData()
            }
        }
    }
    
    // MARK: - API caller for live matches
    

    func liveMatchHandle() {
         APICallerForLiveMatch.shared.fetchData { [weak self] data in
             dump(data)
             
             // if data not found
             if data?.data?.count == 0 {
                 DispatchQueue.main.async {
                     let alertController = UIAlertController(title: "No Data Found", message: "There are currently no live matches available. Please check back later for updates.", preferredStyle: .alert)
                     let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                     alertController.addAction(okAction)
                     self?.present(alertController, animated: true, completion: nil)
                 }
                 
                 //if data found
             } else {
                 self?.liveMatchArray = data
                 self?.tableViewForRecentMatches.reloadData()
        
             }
         }
     }
     

     
    func liveMatches() {
        APICallerForLiveMatch.shared.fetchData { [weak self] data in
            dump(data)
            self?.liveMatchArray = data
            DispatchQueue.main.async {
                self?.tableViewForRecentMatches.reloadData()
            }
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destinationVC = segue.destination as? RecentInfoVC {
            destinationVC.passedInfoArray = recentDataArray?.data?[index ?? 0]
        }
    }
    
    
    @IBAction func goToRecent(_ sender: Any) {
        recentMatches()
    }
    
    
    
    @IBAction func goToUpcoming(_ sender: Any) {
        
        performSegue(withIdentifier: "goToUpcoming", sender: nil)
    }
    
    
    @IBAction func goToLive(_ sender: Any) {
        liveMatchHandle()
    }
    
    
}

// MARK: UITableViewDelegate

extension RecentMatchesVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        index = indexPath.row
        performSegue(withIdentifier: "recentToDetail", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
}

extension RecentMatchesVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recentDataArray?.data?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let tableViewCellForRecentMatch = tableViewForRecentMatches.dequeueReusableCell(withIdentifier: "recentMatchCellIdentifier", for: indexPath) as! RecentMatchesTVCell

        
        tableViewCellForRecentMatch.typeLabel.text = recentDataArray?.data?[indexPath.row].type
        tableViewCellForRecentMatch.localTeamLabel.text =  recentDataArray?.data?[indexPath.row].localteam?.name
        
        tableViewCellForRecentMatch.visitorTeamLabel.text = recentDataArray?.data?[indexPath.row].visitorteam?.name
        
        tableViewCellForRecentMatch.localRunLabel.text = String(recentDataArray?.data?[indexPath.row].runs?[0].score ?? 0)
        
        
        tableViewCellForRecentMatch.visitorRunLabel.text = String(recentDataArray?.data?[indexPath.row].runs?[1].score ?? 0)
        
        tableViewCellForRecentMatch.localWicketLabel.text = String(recentDataArray?.data?[indexPath.row].runs?[0].wickets ?? 0)
        
        tableViewCellForRecentMatch.visitorWicketLabel.text = String(recentDataArray?.data?[indexPath.row].runs?[1].wickets ?? 0)
    
        tableViewCellForRecentMatch.noteLabel.text = recentDataArray?.data?[indexPath.row].note
        
        tableViewCellForRecentMatch.localLogoImgView.sd_setImage(with: URL(string: recentDataArray?.data?[indexPath.row].localteam?.image_path ?? ""), completed: nil)
        
        tableViewCellForRecentMatch.visitorLogoImgView.sd_setImage(with: URL(string: recentDataArray?.data?[indexPath.row].visitorteam?.image_path ?? ""), completed: nil)
         
        return tableViewCellForRecentMatch
        
    }

}

