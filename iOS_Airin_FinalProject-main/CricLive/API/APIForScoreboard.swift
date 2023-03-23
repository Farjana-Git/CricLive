//
//  APIForScoreboard.swift
//  CricLive
//
//  Created by Bjit on 19/2/23.
//


import Foundation

class APICallerForScoreboard {
     
     static let shared = APICallerForScoreboard()
     private init(){}
     
    func fetchDataScoreboard(fixtureID: Int, completion: @escaping (Scoreboard?) -> Void) {
         var dataArray: Scoreboard?
         
         let task = URLSession.shared.dataTask(with: URL(string: "https://cricket.sportmonks.com/api/v2.0/fixtures/\(fixtureID)?filter[status]=Finished&include=batting.batsman,bowling.bowler,localteam,visitorteam&api_token=lxezl1ffokmml78XFBGxCVjRkzD7SpjhWEhIMXgL6TyKi5QCgHvuBdV9paoA")!){ data, response, error in
             if let error = error {
                 print("Server Not found \(error.localizedDescription)")
             }
             else{
                 guard let data = data else {
                     return
                 }
                 print(data)
                 do{
                     let news = try JSONDecoder().decode(Scoreboard.self, from: data)
                     dataArray = news
                     completion(dataArray)
                 }catch{
                     completion(nil)
                 }
             }
         }
         task.resume()
     }
    
    
    
    
    
    
    
    
    
    
    
    
    
    func fetchData(fixtureID: Int, completion: @escaping (CricketData?) -> Void) {
         var dataArray: CricketData?
         
        
         let task = URLSession.shared.dataTask(with: URL(string: "https://cricket.sportmonks.com/api/v2.0/fixtures/27?filter[status]=Finished&include=batting.batsman,bowling.bowler,localteam,visitorteam&api_token=lxezl1ffokmml78XFBGxCVjRkzD7SpjhWEhIMXgL6TyKi5QCgHvuBdV9paoA")!){ data, response, error in
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
