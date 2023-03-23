// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Statistics
struct Statistics: Codable {
    let data: PlayerStatistics?
}

// MARK: - DataClass
struct PlayerStatistics: Codable {
    let resource: String?
    let id, countryID: Int?
    let firstname, lastname, fullname: String?
    let imagePath: String?
    let dateofbirth, gender, battingstyle, bowlingstyle: String?
    let position: PositionPlayerStatistics?
    let updated_at: String?
    let career: [CareerStatistics]?
}

// MARK: - Career
struct CareerStatistics: Codable {

    let type: String?
    let seasonID, playerID: Int?
    let bowling, batting: [String: Double]?
    let updated_at: String?

}

// MARK: - Position
struct PositionPlayerStatistics: Codable {
    let resource: String?
    let id: Int?
    let name: String?
}

