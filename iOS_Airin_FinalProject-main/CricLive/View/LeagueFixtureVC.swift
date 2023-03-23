//
//  LeagueFixtureVC.swift
//  CricLive
//
//  Created by Bjit on 22/2/23.
//

import UIKit
import QuartzCore


class LeagueFixtureVC: UIViewController {
    
    @IBOutlet weak var collectionViewForLeagueFixture: UICollectionView!
    
    var leagueFixturesArray: Upcoming?
    
    @IBOutlet weak var homeView: UIView!
    
    var leagueId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // print("abc", leagueId)

        collectionViewForLeagueFixture.delegate = self
        collectionViewForLeagueFixture.dataSource = self
        
        fetchDataForLeagueFixtures()
        
        homeView.layer.cornerRadius = 35 
        homeView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMaxYCorner]

    }
    
    
    func fetchDataForLeagueFixtures() {
     
        APICallerForLeagueFixtrure.shared.fetchData(leagueId: 3) { [weak self] data in
            dump(data)
            self?.leagueFixturesArray = data
            DispatchQueue.main.async {
                self?.collectionViewForLeagueFixture.reloadData()
            }
        }
    }
    
    
    @IBAction func goToT20League(_ sender: Any) {
        
        APICallerForLeagueFixtrure.shared.fetchData(leagueId: 3) { [weak self] data in
            dump(data)
            self?.leagueFixturesArray = data
            DispatchQueue.main.async {
                self?.collectionViewForLeagueFixture.reloadData()
            }
        }
        
    }
    

    
    @IBAction func BBLLeague(_ sender: Any) {
                APICallerForLeagueFixtrure.shared.fetchData(leagueId: 5) { [weak self] data in
                    dump(data)
                    // if data not found
                    if data?.data?.count == 0 {
                        DispatchQueue.main.async {
                            let alertController = UIAlertController(title: "No Data Found", message: "There are currently no matches available. Please check back later for updates.", preferredStyle: .alert)
                            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                            alertController.addAction(okAction)
                            self?.present(alertController, animated: true, completion: nil)
                        }
                        
                        //if data found
                    } else {
                        self?.leagueFixturesArray = data
                        self?.collectionViewForLeagueFixture.reloadData()
               
                    }
                }
        
    }
    
    
    @IBAction func T20CLeague(_ sender: Any) {
        
        
        APICallerForLeagueFixtrure.shared.fetchData(leagueId: 10) { [weak self] data in
            dump(data)
            // if data not found
            if data?.data?.count == 0 {
                DispatchQueue.main.async {
                    let alertController = UIAlertController(title: "No Data Found", message: "There are currently no matches available. Please check back later for updates.", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alertController.addAction(okAction)
                    self?.present(alertController, animated: true, completion: nil)
                }
                
                //if data found
            } else {
                self?.leagueFixturesArray = data
                self?.collectionViewForLeagueFixture.reloadData()
       
            }
        }
        
        
    }
    
}

extension LeagueFixtureVC: UICollectionViewDelegate {
    
}

extension LeagueFixtureVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellWidth = collectionViewForLeagueFixture.frame.width / 1.0
        let cellHeight = 350.0
        return CGSize(width: cellWidth, height: cellHeight)
        
    }

}

extension LeagueFixtureVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return leagueFixturesArray?.data?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let collectionViewCellForLeagueFixture = collectionViewForLeagueFixture.dequeueReusableCell(withReuseIdentifier: "leagueFixtureCellIdentifier", for: indexPath) as! LeagueFixtureCollectionViewCell
        
        collectionViewCellForLeagueFixture.typeofGameLabel.text = leagueFixturesArray?.data?[indexPath.row].type
        
        collectionViewCellForLeagueFixture.statusLabel.text = leagueFixturesArray?.data?[indexPath.row].status
        
        
        collectionViewCellForLeagueFixture.localteamNameLabel.text = leagueFixturesArray?.data?[indexPath.row].localteam?.name

        collectionViewCellForLeagueFixture.visitorteamNameLabel.text = leagueFixturesArray?.data?[indexPath.row].visitorteam?.name
        
        collectionViewCellForLeagueFixture.venueLabel.text = leagueFixturesArray?.data?[indexPath.row].venue?.name ?? "Awaiting venue confirmation"
        
        collectionViewCellForLeagueFixture.localteamImgView.sd_setImage(with: URL(string: leagueFixturesArray?.data?[indexPath.row].localteam?.image_path ?? ""), completed: nil)

        collectionViewCellForLeagueFixture.visitorteamImgVIew.sd_setImage(with: URL(string: leagueFixturesArray?.data?[indexPath.row].visitorteam?.image_path ?? ""), completed: nil)
        
        
        return collectionViewCellForLeagueFixture
    }
    
    
}
