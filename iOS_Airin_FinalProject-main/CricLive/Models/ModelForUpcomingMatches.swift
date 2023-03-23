////
////  ModelForUpcomingMatches.swift
////  CricLive
////
////  Created by Bjit on 14/2/23.
////
//
//import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)


import Foundation

// MARK: - Upcoming
struct Upcoming: Codable {
    let data: [DatumUpcoming]?
    let links: Links?
    let meta: Meta?
}

// MARK: - DatumUpcoming
struct DatumUpcoming: Codable {
    let id, league_id, season_id, stage_id: Int?
    let round: String?
    let localteam_id, visitorteam_id: Int?
    let starting_at: String?
    let type: String?
    let live: Bool?
    let status: String?
    let note: String?
    let venue_id: Int?
    let superOver, followOn: Bool?
    let localteamDLData, visitorteamDLData: TeamDLData?
    let localteam, visitorteam: TeamUpcoming?
    let venue: VenueUpcoming?
}

// MARK: - Team
struct TeamUpcoming: Codable {

    let id: Int?
    let name, code: String?
    let image_path: String?
    let country_id: Int?
    let national_team: Bool?
    let updated_at: String?
}

// MARK: - TeamDLData
struct TeamDLData: Codable {
    //let score, overs, wicketsOut: NSNull?
}


// MARK: - Stage
struct StageUpcoming: Codable {

    let id, league_id, season_id: Int?
    let name, code: String?
    let type: String?
    let standings: Bool?
    let updated_at: String?
}


// MARK: - Venue
struct VenueUpcoming: Codable {
    //let resource: VenueResource?
    let id, countryID: Int?
    let name, city: String?
    let image_path: String?
    let capacity: Int?
    let floodlight: Bool?
    let updated_at: String?
}

// MARK: - Links
struct Links: Codable {
    let first, last: String?
    //let prev, next: NSNull?
}

// MARK: - Meta
struct Meta: Codable {
    let currentPage, from, lastPage: Int?
    let links: [Link]?
    let path: String?
    let perPage, to, total: Int?
}

// MARK: - Link
struct Link: Codable {
    let url: String?
    let label: String?
    let active: Bool?
}



















































