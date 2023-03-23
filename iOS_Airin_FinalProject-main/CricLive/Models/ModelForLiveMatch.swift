//
//  ModelForLiveMatch.swift
//  CricLive
//
//  Created by Bjit on 25/2/23.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)



// MARK: - Welcome
struct LiveMatch: Codable {
    let data: [Live]?
}

// MARK: - Datum
struct Live: Codable {
    let resource: String?
    let id, league_id, season_id, stage_id: Int?
    let round: String?
    let localteam_id, visitorteam_id: Int?
    let starting_at, type: String?
    let live: Bool?
    let status: String?
    let note: String?
    let venueID, toss_won_team_id: Int?
    let totalOversPlayed: Int?
    let elected: String?
    let superOver, followOn: Bool?
    let localteamDLData, visitorteamDLData: LiveTeamDLData?
    let localteam, visitorteam: LiveLocalteam?
    let runs: [LiveRun]?
    let lineup: [LiveLineupElement]?

    let tosswon: LiveLocalteam?
    let venue: LiveVenue?
    let stage: LiveStage?
}

// MARK: - LineupElement
struct LiveLineupElement: Codable {
  //  let resource: LiveLineupResource?
    let id, country_id: Int?
    let firstname, lastname, fullname: String?
    let image_path: String?
    let dateofbirth: String?
    let gender: String?
    let battingstyle: String?
    let bowlingstyle: String?
    let position: LivePosition?
    let updatedAt: String?
    let lineup: LiveLineupLineup?
}


// MARK: - LineupLineup
struct LiveLineupLineup: Codable {
    let team_id: Int?
    let captain, wicketkeeper, substitution: Bool?
}

// MARK: - Position
struct LivePosition: Codable {
    let id: Int?
    let name: String?
}

// MARK: - Localteam
struct LiveLocalteam:Codable {
    let resource: String?
    let id: Int?
    let name, code: String?
    let image_path: String?
    let country_id: Int?
    let national_team: Bool?
    let updatedAt: String?
}

// MARK: - TeamDLData
struct LiveTeamDLData: Codable {
    //let score, overs, wicketsOut: NSNull?
}

// MARK: - Run
struct LiveRun: Codable {
    let resource: String?
    let id, fixture_id, team_id, inning: Int?
    let score, wickets, overs: Int?
    let pp1: String?

    let updatedAt: String?
    let team: LiveLocalteam?
}

// MARK: - Stage
struct LiveStage: Codable {
    let resource: String?
    let id, league_id, season_id: Int?
    let name, code, type: String?
    let standings: Bool?
    let updatedAt: String?
}

// MARK: - Venue
struct LiveVenue: Codable {
    let resource: String?
    let id, country_id: Int?
    let name, city: String?
    let image_path: String?
    let floodlight: Bool?
    let updated_at: String?
}
