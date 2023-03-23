//
//  Search&InfoPlayerModel.swift
//  CricLive
//
//  Created by Bjit on 20/2/23.
//

import Foundation

struct PlayersData: Codable, Sequence {
    let data: [Playerdata]?
    
    func makeIterator() -> PlayerIterator {
        return PlayerIterator(data: data)
    }

    struct PlayerIterator: IteratorProtocol {
        let data: [Playerdata]?
        var currentIndex = 0

        init(data: [Playerdata]?) {
            self.data = data
        }

        mutating func next() -> Playerdata? {
            guard let data = data, currentIndex < data.count else {
                return nil
            }

            let result = data[currentIndex]
            currentIndex += 1
            return result
        }
    }
}

// MARK: - Datum
struct Playerdata: Codable {

    let resource: String?
    let id: Int?
    let fullname: String?
    let image_path: String?
    let country: PlayerCountry?
    let updated_at: String?
    let dateofbirth, battingstyle, bowlingstyle: String?
    let position: PlayerPosition?
}

// MARK: - Country
struct PlayerCountry: Codable {

    let resource: String?
    let id, continent_id: Int?
    let name: String?
    let image_path: String?
    let updated_at: String?
}

struct PlayerPosition: Codable {
    let resource: String?
    let id: Int?
    let name: String?
}


