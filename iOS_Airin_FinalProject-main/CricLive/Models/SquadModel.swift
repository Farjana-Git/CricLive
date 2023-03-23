


import Foundation

// MARK: - Welcome
struct Squad: Codable {
    let data: DataClassSquad?
}

// MARK: - DataClass
struct DataClassSquad: Codable {
    let resource: String?
    let id, leagueID, seasonID, stageID: Int?
    let round: String?
    let localteam_id, visitorteam_id: Int?
    let startingAt, type: String?
    let live: Bool?
    let status: String?
    let note: String?
    let venueID, tossWonTeamID, winnerTeamID: Int?
    let firstUmpireID, secondUmpireID, tvUmpireID, refereeID: Int?
    let elected: String?
    let superOver, followOn: Bool?
    let rpcOvers, rpcTarget: String?
    let lineup: [LineupElementSquad]?
}

// MARK: - LineupElementSquad
struct LineupElementSquad: Codable {
    let id: Int?
    let fullname: String?
    let image_path: String?
    let updated_at: String?
    let lineup: LineupLineupSquad?
}

// MARK: - LineupLineupSquad
struct LineupLineupSquad: Codable {
    let team_id: Int?
    let captain, wicketkeeper, substitution: Bool?
}

