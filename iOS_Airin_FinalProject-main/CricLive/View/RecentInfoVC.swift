//
//  RecentInfoVC.swift
//  CricLive
//
//  Created by Bjit on 15/2/23.
//

import UIKit

class RecentInfoVC: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    
    @IBOutlet weak var matchLabel: UILabel!
    @IBOutlet weak var matchDescLabel: UILabel!
    
    @IBOutlet weak var tosswonLabel: UILabel!
    @IBOutlet weak var tosswonDescLabel: UILabel!
    
    @IBOutlet weak var winnerTeamLabel: UILabel!
    @IBOutlet weak var winnerTeamDescLabel: UILabel!
    
    @IBOutlet weak var momLabel: UILabel!
    @IBOutlet weak var momDescLabel: UILabel!
    
    @IBOutlet weak var seriesLabel: UILabel!
    @IBOutlet weak var seriesDescLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var dateDescLabel: UILabel!
    
    @IBOutlet weak var stadiumLabel: UILabel!
    @IBOutlet weak var stadiumDescLabel: UILabel!
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var cityDescLabel: UILabel!
    
    @IBOutlet weak var capacityLabel: UILabel!
    @IBOutlet weak var capacityDescLabel: UILabel!
    
    
    var passedInfoArray: Match?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        matchLabel.text = "Match"
        matchDescLabel.text = passedInfoArray?.type
        
        tosswonLabel.text = "Toss Won"
        tosswonDescLabel.text = passedInfoArray?.tosswon?.name
        
        winnerTeamLabel.text = "Winner Team"
        winnerTeamDescLabel.text = passedInfoArray?.localteam?.name
        
        momLabel.text = "MoM"
        momDescLabel.text = passedInfoArray?.manofmatch?.fullname
        
        seriesLabel.text = "Series"
        seriesDescLabel.text = passedInfoArray?.stage?.name
        
        dateLabel.text = "Date & Time"
        dateDescLabel.text = passedInfoArray?.starting_at
        
        stadiumLabel.text = "Name"
        stadiumDescLabel.text = passedInfoArray?.venue?.name
        
        cityLabel.text = "City"
        cityDescLabel.text = passedInfoArray?.venue?.city
        
        capacityLabel.text = "Capacity"
        capacityDescLabel.text = String(passedInfoArray?.venue?.capacity ?? 0)
    
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToSquad",
            let destinationSquadVC = segue.destination as? SquadListVC {
                        destinationSquadVC.fixtureID = passedInfoArray?.id
        }
        if segue.identifier == "goToScoreboard",
            let destinationScoreboardVC = segue.destination as? ScoreboardVC {
                        destinationScoreboardVC.fixtureID = passedInfoArray?.id
                }
        
    }
    
    @IBAction func goToSquad(_ sender: Any) {
        performSegue(withIdentifier: "goToSquad", sender: nil)
    }
    
    @IBAction func goToScoreboard(_ sender: Any) {
        performSegue(withIdentifier: "goToScoreboard", sender: nil)
    }

    
}
