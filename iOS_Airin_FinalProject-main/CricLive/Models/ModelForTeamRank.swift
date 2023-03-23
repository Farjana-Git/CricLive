//
//  ModelForTeamRank.swift
//  CricLive
//
//  Created by Bjit on 21/2/23.
//

import Foundation

struct Teams: Codable {
    let data: [TeamRanks]?
}

// MARK: - TeamRanks
struct TeamRanks: Codable {
    let resource, type: String?
    let gender, updated_at: String?
    let team: [AllTeam]?
}

// MARK: - AllTeam
struct AllTeam: Codable {
    let resource: String?
    let id: Int?
    let name, code: String?
    let image_path: String?
    let country_id: Int?
    let national_team: Bool?
    let position: Int?
    let updated_at: String?
    let ranking: TeamRanking?
}

// MARK: - TeamRanking
struct TeamRanking: Codable {
    let position, matches, points, rating: Int?
}
