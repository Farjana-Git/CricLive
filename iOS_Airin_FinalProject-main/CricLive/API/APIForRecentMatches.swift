//
//  APIForRecentMatches.swift
//  CricLive
//
//  Created by Bjit on 13/2/23.
//


import Foundation

class APICaller {
     
     static let shared = APICaller()
     private init(){}
     
     func fetchData(completion: @escaping (CricketData?) -> Void) {
         var dataArray: CricketData?
         
         let task = URLSession.shared.dataTask(with: URL(string: "https://cricket.sportmonks.com/api/v2.0/fixtures?api_token=lxezl1ffokmml78XFBGxCVjRkzD7SpjhWEhIMXgL6TyKi5QCgHvuBdV9paoA&filter[starts_between]=2023-01-24,2023-02-24&sort=-starting_at&include=stage,localteam,visitorteam,tosswon,winnerteam,venue,lineup,runs.team,manofmatch")!){ data, response, error in
             if let error = error {
                 print("Server Not found \(error.localizedDescription)")
             }
             else{
                 guard let data = data else {
                     return
                 }
                 print(data)
                 do{
                     let news = try JSONDecoder().decode(CricketData.self, from: data)
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
 
