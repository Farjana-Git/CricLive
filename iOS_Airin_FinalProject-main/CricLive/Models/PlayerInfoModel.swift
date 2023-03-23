//
//  PlayerInfoModel.swift
//  CricLive
//
//  Created by Bjit on 21/2/23.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct PlayerInfo: Codable {
    let data: DataClassPlayerInfo?
}

// MARK: - DataClass
struct DataClassPlayerInfo: Codable {
    let resource: String?
    let id: Int?
    let fullname: String?
    let image_path: String?
    let dateofbirth, battingstyle, bowlingstyle: String?
    let position: PositionPlayerInfo?
    let country: CountryPlayerInfo?
    let updated_at: String?
}

// MARK: - Country
struct CountryPlayerInfo: Codable {
    let resource: String?
    let id, continentID: Int?
    let name: String?
    let image_path: String?
    let updated_at: String?
}

// MARK: - Position
struct PositionPlayerInfo: Codable {
    let resource: String?
    let id: Int?
    let name: String?
}

