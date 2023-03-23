//
//  APIForLeagueFixture.swift
//  CricLive
//
//  Created by Bjit on 22/2/23.
//

import Foundation

class APICallerForLeagueFixtrure {
     
     static let shared = APICallerForLeagueFixtrure()
     private init(){}
     
    func fetchData(leagueId: Int, completion: @escaping (Upcoming?) -> Void) {
         var dataArray: Upcoming?
         
         let task = URLSession.shared.dataTask(with: URL(string: "https://cricket.sportmonks.com/api/v2.0/fixtures?api_token=lxezl1ffokmml78XFBGxCVjRkzD7SpjhWEhIMXgL6TyKi5QCgHvuBdV9paoA&filter[status]=NS&filter[league_id]=\(leagueId)&sort=starting_at&include=stage,localteam,visitorteam,runs,venue")!){ data , response, error in
             if let error = error {
                 print("Server Not found \(error.localizedDescription)")
             }
             else{
                 guard let data = data else {
                     return
                 }
                 print(data)
                 do{
                     let news = try JSONDecoder().decode(Upcoming.self, from: data)
                     dataArray = news
                     completion(dataArray)
                 }catch{
                     completion(nil)
                 }
             }
         }
         task.resume()
     }
 }
