//
//  APIForLiveMatch.swift
//  CricLive
//
//  Created by Bjit on 25/2/23.
//

import Foundation

class APICallerForLiveMatch {
     
     static let shared = APICallerForLiveMatch()
     private init(){}
     
     func fetchData(completion: @escaping (LiveMatch?) -> Void) {
         var dataArray: LiveMatch?
         
         let task = URLSession.shared.dataTask(with: URL(string: "https://cricket.sportmonks.com/api/v2.0/livescores?api_token=lxezl1ffokmml78XFBGxCVjRkzD7SpjhWEhIMXgL6TyKi5QCgHvuBdV9paoA&sort=-starting_at&include=stage,localteam,visitorteam,tosswon,venue,lineup,runs.team")!){ data, response, error in
             if let error = error {
                 print("Server Not found \(error.localizedDescription)")
             }
             else{
                 guard let data = data else {
                     return
                 }
                 print(data)
                 do{
                     let news = try JSONDecoder().decode(LiveMatch.self, from: data)
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

