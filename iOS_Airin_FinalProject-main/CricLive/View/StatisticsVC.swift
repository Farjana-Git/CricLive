//
//  StatisticsVC.swift
//  CricLive
//
//  Created by Bjit on 23/2/23.
//

import UIKit

class StatisticsVC: UIViewController {
    
    @IBOutlet weak var tableViewForStatistics: UITableView!
    @IBOutlet weak var playerNameLabel: UILabel!
    
    var statisticsArray: Statistics?
    
    var totMatch = 0
    var totOver = 0
    var totMedians = 0
    var totRun = 0
    var totWickets = 0
    var totWide = 0
    var totNoBall = 0

    var totRunScored = 0
    var totNotOut = 0
    var totBallsFaced = 0
    var totFour = 0
    var totSix = 0
    var totHundreds = 0
    
    let spaceBetweenSections = 80
    
    var playerId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableViewForStatistics.delegate = self
        tableViewForStatistics.dataSource = self
        
        playerNameLabel.text = statisticsArray?.data?.fullname
        
        getStatisticsT20()
        
    }
    
    
    @IBAction func goToT20(_ sender: Any) {
        getStatisticsT20()
    }
    
    @IBAction func goToT20I(_ sender: Any) {
        getStatisticsT20I()
    }

    @IBAction func goToODI(_ sender: Any) {
        getStatisticsODI()
    }
    
    
    // MARK: - API Caller for T20
    func getStatisticsT20() {
        
        guard let playerId = playerId else {
            return
        }
        
        APICallerForStatistics.shared.fetchData(playerID: playerId) { [weak self] data in
            dump(data)
            self?.statisticsArray = data
           
            self?.calculateT20()
            
            DispatchQueue.main.async {
                self?.tableViewForStatistics.reloadData()
            }
        }
        
    }
    
    
    // MARK: - API Caller for T20I
    func getStatisticsT20I() {
        
        guard let playerId = playerId else {
            return
        }
        
        APICallerForStatistics.shared.fetchData(playerID: playerId) { [weak self] data in
            dump(data)
            self?.statisticsArray = data
           
            self?.calculateT20I()
            
            DispatchQueue.main.async {
                self?.tableViewForStatistics.reloadData()
            }
        }
        
        
    }
    
    // MARK: - API Caller for ODI
    func getStatisticsODI() {
        
        guard let playerId = playerId else {
            return
        }
        
        APICallerForStatistics.shared.fetchData(playerID: playerId) { [weak self] data in
            dump(data)
            self?.statisticsArray = data
           
            self?.calculateODI()
            
            DispatchQueue.main.async {
                self?.tableViewForStatistics.reloadData()
            }
        }
        
        print("playerID ",playerId)
        
    }
    
    
    // MARK: - Calculation of T20 Statistics
    func calculateT20() {
        totMatch = 0
        totOver = 0
        totMedians = 0
        totRun = 0
        totWickets = 0
        totWide = 0
        totNoBall = 0
        
        totRunScored = 0
        totNotOut = 0
        totBallsFaced = 0
        totFour = 0
        totSix = 0
        totHundreds = 0
        
        for player in 0..<(statisticsArray?.data?.career?.count ?? 0){
            if statisticsArray?.data?.career?[player].type == "T20" {
                if let bowlingMatch = statisticsArray?.data?.career?[player].bowling?["matches"],
                   let bowlingOver = statisticsArray?.data?.career?[player].bowling?["overs"],
                   let bowlingMedians = statisticsArray?.data?.career?[player].bowling?["medians"],
                   let bowlingRun = statisticsArray?.data?.career?[player].bowling?["runs"],
                   let bowlingWickets = statisticsArray?.data?.career?[player].bowling?["wickets"],
                   let bowlingWide = statisticsArray?.data?.career?[player].bowling?["wide"],
                   let bowlingNoBall = statisticsArray?.data?.career?[player].bowling?["noball"]{
                    
                    totMatch = (totMatch) + Int(bowlingMatch)
                    totOver = (totOver) + Int(bowlingOver)
                    totMedians = (totMedians) + Int(bowlingMedians)
                    totRun = (totRun) + Int(bowlingRun)
                    totWickets = (totWickets) + Int(bowlingWickets)
                    totWide = (totWide) + Int(bowlingWide)
                    totNoBall = (totNoBall) + Int(bowlingNoBall)
                }
            }

        }
        
        
        for player in 0..<(statisticsArray?.data?.career?.count ?? 0) {
            if statisticsArray?.data?.career?[player].type == "T20" {
            if let battingMatch = statisticsArray?.data?.career?[player].batting?["matches"],
               let battingRuns_Scored = statisticsArray?.data?.career?[player].batting?["runs_scored"],
               let batting_notOuts = statisticsArray?.data?.career?[player].batting?["not_outs"],
               let batting_ballsFaced = statisticsArray?.data?.career?[player].batting?["balls_faced"],
               let batting_four = statisticsArray?.data?.career?[player].batting?["four_x"],
               let batting_six = statisticsArray?.data?.career?[player].batting?["six_x"],
               let batting_hundreds = statisticsArray?.data?.career?[player].batting?["hundreds"]{

                    totMatch = (totMatch) + Int(battingMatch)
                    totRunScored = (totRunScored) + Int(battingRuns_Scored)
                    totNotOut = (totNotOut) + Int(batting_notOuts)
                    totBallsFaced = (totBallsFaced) + Int(batting_ballsFaced)
                    totFour = (totFour) + Int(batting_four)
                    totSix = (totSix) + Int(batting_six)
                    totHundreds = (totHundreds) + Int(batting_hundreds)
                }
            }
        }
    }
    
    
    // MARK: - Calculation of T20I Statistics
    func calculateT20I() {
        totMatch = 0
        totOver = 0
        totMedians = 0
        totRun = 0
        totWickets = 0
        totWide = 0
        totNoBall = 0
        
        totRunScored = 0
        totNotOut = 0
        totBallsFaced = 0
        totFour = 0
        totSix = 0
        totHundreds = 0
        for player in 0..<(statisticsArray?.data?.career?.count ?? 0){
            
            if statisticsArray?.data?.career?[player].type == "T20I" {
                
            if let bowlingMatch = statisticsArray?.data?.career?[player].bowling?["matches"],
               let bowlingOver = statisticsArray?.data?.career?[player].bowling?["overs"],
               let bowlingMedians = statisticsArray?.data?.career?[player].bowling?["medians"],
               let bowlingRun = statisticsArray?.data?.career?[player].bowling?["runs"],
               let bowlingWickets = statisticsArray?.data?.career?[player].bowling?["wickets"],
               let bowlingWide = statisticsArray?.data?.career?[player].bowling?["wide"],
               let bowlingNoBall = statisticsArray?.data?.career?[player].bowling?["noball"]{

                    totMatch = (totMatch) + Int(bowlingMatch)
                    totOver = (totOver) + Int(bowlingOver)
                    totMedians = (totMedians) + Int(bowlingMedians)
                    totRun = (totRun) + Int(bowlingRun)
                    totWickets = (totWickets) + Int(bowlingWickets)
                    totWide = (totWide) + Int(bowlingWide)
                    totNoBall = (totNoBall) + Int(bowlingNoBall)
                }
            }

        }
        
        
        for player in 0..<(statisticsArray?.data?.career?.count ?? 0) {
            
            if statisticsArray?.data?.career?[player].type == "T20" {
            
            if let battingMatch = statisticsArray?.data?.career?[player].batting?["matches"],
               
               let battingRuns_Scored = statisticsArray?.data?.career?[player].batting?["runs_scored"],
               
               let batting_notOuts = statisticsArray?.data?.career?[player].batting?["not_outs"],
               
               let batting_ballsFaced = statisticsArray?.data?.career?[player].batting?["balls_faced"],
               
               let batting_four = statisticsArray?.data?.career?[player].batting?["four_x"],
               
               let batting_six = statisticsArray?.data?.career?[player].batting?["six_x"],
               
               let batting_hundreds = statisticsArray?.data?.career?[player].batting?["hundreds"]{
                    
                    totMatch = (totMatch) + Int(battingMatch)
                    
                    totRunScored = (totRunScored) + Int(battingRuns_Scored)
                    
                    totNotOut = (totNotOut) + Int(batting_notOuts)
                    
                    totBallsFaced = (totBallsFaced) + Int(batting_ballsFaced)
                    
                    totFour = (totFour) + Int(batting_four)
                    
                    totSix = (totSix) + Int(batting_six)
                    
                    totHundreds = (totHundreds) + Int(batting_hundreds)
                }
            }
        }
    }
    
    
    // MARK: - Calculation of ODI Statistics
    func calculateODI() {
        totMatch = 0
        totOver = 0
        totMedians = 0
        totRun = 0
        totWickets = 0
        totWide = 0
        totNoBall = 0
        
        totRunScored = 0
        totNotOut = 0
        totBallsFaced = 0
        totFour = 0
        totSix = 0
        totHundreds = 0
        for player in 0..<(statisticsArray?.data?.career?.count ?? 0){
            
            if statisticsArray?.data?.career?[player].type == "ODI" {
            
            if let bowlingMatch = statisticsArray?.data?.career?[player].bowling?["matches"],
               let bowlingOver = statisticsArray?.data?.career?[player].bowling?["overs"],
    
               let bowlingMedians = statisticsArray?.data?.career?[player].bowling?["medians"],
               
               let bowlingRun = statisticsArray?.data?.career?[player].bowling?["runs"],
               
               let bowlingWickets = statisticsArray?.data?.career?[player].bowling?["wickets"],
               
               let bowlingWide = statisticsArray?.data?.career?[player].bowling?["wide"],
               
               let bowlingNoBall = statisticsArray?.data?.career?[player].bowling?["noball"]{
    
                    totMatch = (totMatch) + Int(bowlingMatch)
                    
                    totOver = (totOver) + Int(bowlingOver)
                    
                    totMedians = (totMedians) + Int(bowlingMedians)
                    
                    totRun = (totRun) + Int(bowlingRun)
                    
                    totWickets = (totWickets) + Int(bowlingWickets)
                    
                    totWide = (totWide) + Int(bowlingWide)
                    
                    totNoBall = (totNoBall) + Int(bowlingNoBall)
                }
            }

        }
        
        
        for player in 0..<(statisticsArray?.data?.career?.count ?? 0) {
            if statisticsArray?.data?.career?[player].type == "T20" {
            
            if let battingMatch = statisticsArray?.data?.career?[player].batting?["matches"],
               
               let battingRuns_Scored = statisticsArray?.data?.career?[player].batting?["runs_scored"],
               
               let batting_notOuts = statisticsArray?.data?.career?[player].batting?["not_outs"],
               
               let batting_ballsFaced = statisticsArray?.data?.career?[player].batting?["balls_faced"],
               
               let batting_four = statisticsArray?.data?.career?[player].batting?["four_x"],
               
               let batting_six = statisticsArray?.data?.career?[player].batting?["six_x"],
               
               let batting_hundreds = statisticsArray?.data?.career?[player].batting?["hundreds"]{

                    
                    totMatch = (totMatch) + Int(battingMatch)
                    
                    totRunScored = (totRunScored) + Int(battingRuns_Scored)
                    
                    totNotOut = (totNotOut) + Int(batting_notOuts)
                    
                    totBallsFaced = (totBallsFaced) + Int(batting_ballsFaced)
                    
                    totFour = (totFour) + Int(batting_four)
                    
                    totSix = (totSix) + Int(batting_six)
                    
                    totHundreds = (totHundreds) + Int(batting_hundreds)
                }
            }
        }
    }


}




extension StatisticsVC: UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Bowling Statistics"
        } else {
            return "Battiing Statistics"
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(spaceBetweenSections/2)
    }
}

extension StatisticsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
        
        if indexPath.section == 0 {
            let tableViewCellForGetStatistics = tableViewForStatistics.dequeueReusableCell(withIdentifier: "statisticsCellIdentifier", for: indexPath) as! StatisticsTVCell

            
            tableViewCellForGetStatistics.totalMatchLabel.text = "Total Match"
            tableViewCellForGetStatistics.totalMatchDescLabel.text = String(totMatch)
            
            tableViewCellForGetStatistics.totalOverRunScoredLabel.text = "Total Over"
            tableViewCellForGetStatistics.totalOverRunScoredDescLabel.text = String(totOver)
            
            tableViewCellForGetStatistics.totalMediansNotoutLabel.text = "Total Medians"
            tableViewCellForGetStatistics.totalMediansNotoutDescLabel.text = String(totMedians)
            
            tableViewCellForGetStatistics.totalRunsBallsFacedLabel.text = "Total Runs"
            tableViewCellForGetStatistics.totalRunsBallsFacedDescLabel.text = String(totRun)
            
            tableViewCellForGetStatistics.totalWicketsFour_xLabel.text = "Total Wickets"
            tableViewCellForGetStatistics.totalWicketsFour_xDescLabel.text = String(totWickets)
            
            tableViewCellForGetStatistics.totalWideSix_xLabel.text = "Total Wide"
            tableViewCellForGetStatistics.totalWideSix_xDescLabel.text = String(totWide)
            
            tableViewCellForGetStatistics.TotalNoballHundredLabel.text = "Total Noball"
            tableViewCellForGetStatistics.TotalNoballHundredDescLabel.text = String(totNoBall)
            
            return tableViewCellForGetStatistics
        }
        
        else {
            let tableViewCellForGetStatistics = tableViewForStatistics.dequeueReusableCell(withIdentifier: "statisticsCellIdentifier", for: indexPath) as! StatisticsTVCell
            
            tableViewCellForGetStatistics.totalMatchLabel.text = "Total Match"
            tableViewCellForGetStatistics.totalMatchDescLabel.text = String(totMatch)
            
            tableViewCellForGetStatistics.totalOverRunScoredLabel.text = "Total Run Scored"
            tableViewCellForGetStatistics.totalOverRunScoredDescLabel.text = String(totRunScored)
            
            tableViewCellForGetStatistics.totalMediansNotoutLabel.text = "Total NotOut"
            tableViewCellForGetStatistics.totalMediansNotoutDescLabel.text = String(totNotOut)
            
            tableViewCellForGetStatistics.totalRunsBallsFacedLabel.text = "Total Balls Faced"
            tableViewCellForGetStatistics.totalRunsBallsFacedDescLabel.text = String(totBallsFaced)
            
            tableViewCellForGetStatistics.totalWicketsFour_xLabel.text = "Total Four"
            tableViewCellForGetStatistics.totalWicketsFour_xDescLabel.text = String(totFour)
            
            tableViewCellForGetStatistics.totalWideSix_xLabel.text = "Total Six"
            tableViewCellForGetStatistics.totalWideSix_xDescLabel.text = String(totSix)
            
            tableViewCellForGetStatistics.TotalNoballHundredLabel.text = "Total Hundreds"
            tableViewCellForGetStatistics.TotalNoballHundredDescLabel.text = String(totHundreds)
            
            
            return tableViewCellForGetStatistics
        }
        
        
        
        
    }
    
    
}

