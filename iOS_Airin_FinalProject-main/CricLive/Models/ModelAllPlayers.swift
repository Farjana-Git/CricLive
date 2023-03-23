//
//  ModelAllPlayers.swift
//  CricLive
//
//  Created by Bjit on 20/2/23.
//

import Foundation

// MARK: - AllPlayers
struct AllPlayers: Codable {
    let data: [Players]?
}

// MARK: - Players
struct Players: Codable {
    let id, country_id: Int?
    let firstname, lastname, fullname: String?
    let image_path: String?
    let dateofbirth: String?
    let battingstyle: String?
    let bowlingstyle: String?
    let position: Position?
    let updated_at: String?
    let career: [PlayerCareer]?
    let teams: [TeamForPlayer]?
    
}

struct PlayerCareer: Codable {

    let type: String?
    let season_id, player_id: Int?
    let bowling, batting: [String: Double]?
    let updatedAt: String?
}


// MARK: - TeamForPlayer
struct TeamForPlayer: Codable {
    let resource: String?
    let id: Int?
    let name, code: String?
    let imagePath: String?
    let countryID: Int?
    let nationalTeam: Bool?
    let updatedAt: String?
    let inSquad: InSquadForPalyer?
}

// MARK: - InSquadForPalyer
struct InSquadForPalyer: Codable {
    let seasonID, leagueID: Int?
}


// MARK: - Position
struct Position: Codable {

    let id: Int?

    let name: String?
}
