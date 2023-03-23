//
//  SquadListVC.swift
//  CricLive
//
//  Created by Bjit on 17/2/23.
//

import UIKit

class SquadListVC: UIViewController {
    
    @IBOutlet weak var tableViewForSquadList: UITableView!
    
    var squadListArray: Squad?
    var fixtureID: Int?
    var index = 0
    
    var localTeamArray = [LineupElementSquad]()
    var visitorTeamArray = [LineupElementSquad]()
    
    var passedSquadListArray: Match?
    
    let spaceBetweenSections = 100

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewForSquadList.delegate = self
        tableViewForSquadList.dataSource = self
        
        fetchSquad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "squadToCareer" {
            let destVC = segue.destination as? StatisticsVC
            destVC?.playerId = squadListArray?.data?.lineup?[index].id
        }
    }
    
    func fetchSquad() {
        APICallerForSqude.shared.fetchData(fixtureID: fixtureID ?? 0) { [weak self] data in
            dump(data)
            self?.squadListArray = data
            
            
            
            
            for i in 0..<(self?.squadListArray?.data?.lineup?.count ?? 0) {
                if self?.squadListArray?.data?.localteam_id == self?.squadListArray?.data?.lineup?[i].lineup?.team_id {
                    guard let local = self?.squadListArray?.data?.lineup?[i] else {
                        return
                    }
                    self?.localTeamArray.append(local)
                }
            }
        
            for i in 0..<(self?.squadListArray?.data?.lineup?.count ?? 0) {
                if self?.squadListArray?.data?.visitorteam_id == self?.squadListArray?.data?.lineup?[i].lineup?.team_id {
                    guard let visitor = self?.squadListArray?.data?.lineup?[i] else {
                        return
                    }
                    self?.visitorTeamArray.append(visitor)
                }
            }
            
            DispatchQueue.main.async {
                self?.tableViewForSquadList.reloadData()
            }
        }
    }
  
}

// MARK: - Extension
extension SquadListVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
        performSegue(withIdentifier: "squadToCareer", sender: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
        
    }
    
    
     func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
             return "Squad List"
     }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(spaceBetweenSections/2)
    }

     
}

extension SquadListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {

            return localTeamArray.count
        }
        else {
            return visitorTeamArray.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.section == 0 {
            
            let tableViewCellForSquadList = tableViewForSquadList.dequeueReusableCell(withIdentifier: "squadListCellIdentifier", for: indexPath) as! SquadListTVCell
            
            tableViewCellForSquadList.playerNameLabel.text = localTeamArray[indexPath.row].fullname
            
            tableViewCellForSquadList.squadImgView.sd_setImage(with: URL(string: localTeamArray[indexPath.row].image_path ?? ""), completed: nil)
            return tableViewCellForSquadList
            
        }
        else {
            let tableViewCellForSquadList = tableViewForSquadList.dequeueReusableCell(withIdentifier: "squadListCellIdentifier", for: indexPath) as! SquadListTVCell
            
            tableViewCellForSquadList.playerNameLabel.text = visitorTeamArray[indexPath.row].fullname
            
            tableViewCellForSquadList.squadImgView.sd_setImage(with: URL(string: visitorTeamArray[indexPath.row].image_path ?? ""), completed: nil)
            return tableViewCellForSquadList
        }
         

    }
    
}
