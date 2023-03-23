//
//  MoreVC.swift
//  CricLive
//
//  Created by Bjit on 22/2/23.
//

import UIKit

class MoreVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func goToSearchPlayer(_ sender: Any) {
        performSegue(withIdentifier: "goToSearchPlayer", sender: nil)
    }
    
    @IBAction func goToTeamRank(_ sender: Any) {
        performSegue(withIdentifier: "goToTeamRank", sender: nil)
    }
    
}
