
//  Model.swift
//  CricLive
//
//  Created by Bjit on 13/2/23.
//

import Foundation

// MARK: - CricketData
struct CricketData: Codable {
    let data: [Match]?
}

// MARK: - Match
struct Match: Codable {
    let id, league_id, season_id, stage_id: Int?
    let round: String?
    let localteam_id, visitorteam_id: Int?
    let starting_at: String?
    let type: String?
    let status: String?
    let note: String?
    let venue_id: Int?
    let toss_won_team_id, winner_team_id : Int?
    let localteam, visitorteam: Team?
    let runs: [Run]?
    let stage: Stage?
    let venue: Venue?
    let batting: [Batting]?
    let lineup: [LineupElement]?
    let manofmatch: LineupElement?
    let tosswon: Localteam?
    let winnerteam: Localteam?
    

}

// MARK: - Team
struct Team: Codable {
    let id: Int?
    let name, code: String?
    let image_path: String?
    let country_id: Int?
    let national_team: Bool?
}


// MARK: - Run
struct Run: Codable {
    let id, fixture_id, team_id, inning: Int?
    let score, wickets: Int?
    let overs: Double?
}


// MARK: - Stage
struct Stage: Codable {
    let id, league_id, season_id: Int?
    let name, code: String?
    let type: String?
}

// MARK: - PlayerData
struct PlayerData: Codable {
    let resource: String?
    let id: Int?
    let fullname: String?
    let image_path: String?
    let dateofbirth, gender, battingstyle, bowlingstyle: String?
    let position: Positionx?
    let country: Country?
    let updated_at: String?
    let career: [Career]?
    let teams, currentteams: [Team]?
}

// MARK: - Positionx
struct Positionx: Codable {
    let name: String?
}

// MARK: - Country
struct Country: Codable {
    let name: String?
    let image_path: String?
}

// MARK: - Career
struct Career: Codable {
    let type: String?
    let season_id, player_id: Int?
    let bowling: [String: Double?]?
    let batting: [String: Double?]?
    let updated_at: String?
    let season: Season?
}

// MARK: - Season
struct Season: Codable {
    let resource: String?
    let id, leagueID: Int?
    let name, code, updatedAt: String?
}

// MARK: - InSquad
struct InSquad: Codable {
    let seasonID, leagueID: Int?
}

// MARK: Venue
struct Venue: Codable {
    //let resource: String?
    let id, country_id: Int?
    let name, city: String?
    let image_path: String?
    let capacity: Int?
    let floodlight: Bool?
    let updated_at: String?
}


// MARK: - Batting
struct Batting: Codable {
    let team_id: Int?
    let score, ball: Int?
    let four_x, six_x: Int?
    let rate: Double?
    let batsman: Batsman?
}

// MARK: - Batsman
struct Batsman: Codable {
    let fullname: String?
}

// MARK: - LineupElement
struct LineupElement: Codable {
    let firstname, lastname, fullname: String?
    let image_path: String?
    let lineup: LineupLineup?
    
}

// MARK: - LineupLineup
struct LineupLineup: Codable {
    let team_id: Int?
}


// MARK: - Localteam
struct Localteam: Codable{
    let name: String?
}
