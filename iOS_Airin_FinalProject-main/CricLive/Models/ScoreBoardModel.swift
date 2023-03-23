
import Foundation

// MARK: - Welcome
struct Scoreboard: Codable {
    let data: DataClassScoreboard?
}

// MARK: - DataClass
struct DataClassScoreboard: Codable  {
    let resource: String?
    let id, leagueID, seasonID, stageID: Int?
    let round: String?
    let localteamID, visitorteamID: Int?
    let startingAt, type: String?
    let live: Bool?
    let status: String?
    let note: String?
    let venueID, tossWonTeamID, winnerTeamID: Int?
    let firstUmpireID, secondUmpireID, tvUmpireID, refereeID: Int?
    let manOfMatchID: Int?
    let elected: String?
    let superOver, followOn: Bool?
    let localteam, visitorteam: Team?
    let batting: [BattingScoreboard]?
    let bowling: [BowlingScoreboard]?
}

// MARK: - Batting
struct BattingScoreboard: Codable  {
    let id, sort, fixtureID, teamID: Int?
    let active: Bool?
    let playerID, ball, scoreID, score: Int?
    let four_x, six_x: Int?
    let catchStumpPlayerID: Int?
    let bowlingPlayerID: Int?
    let fowScore: Int?
    let fowBalls, rate: Double?
    let updatedAt: String?
    let batsman: BatsmanScoreboard?
}

// MARK: - Batsman
struct BatsmanScoreboard: Codable  {
    let id, countryID: Int?
    let firstname, lastname, fullname: String?
    let imagePath: String?
    let dateofbirth: String?
    let gender: String?
    let battingstyle: String?
    let bowlingstyle: String?
    let updatedAt: String?
}


// MARK: - Bowling
struct BowlingScoreboard: Codable  {
    let id, sort, fixture_id, team_id: Int?
    let active: Bool?
    let playerID: Int?
    let overs: Double?
    let medians, runs, wickets, wide: Int?
    let noball: Int?
    let rate: Double?
    let updatedAt: String?
    let bowler: BatsmanScoreboard?
}


// MARK: - Team
struct TeamScoreboard: Codable  {
    let resource: String?
    let id: Int?
    let name, code: String?
    let imagePath: String?
    let countryID: Int?
    let nationalTeam: Bool?
    let updatedAt: String?
}

