//
//  APIForUpcomingMatches.swift
//  CricLive
//
//  Created by Bjit on 14/2/23.
//

import Foundation
import SDWebImage

class APICallerForUpcomigMatches {
     
     static let shared = APICallerForUpcomigMatches()
     private init(){}
     
     func fetchData(completion: @escaping (Upcoming?) -> Void) {
         var dataArray: Upcoming?
         
         let task = URLSession.shared.dataTask(with: URL(string: "https://cricket.sportmonks.com/api/v2.0/fixtures?api_token=lxezl1ffokmml78XFBGxCVjRkzD7SpjhWEhIMXgL6TyKi5QCgHvuBdV9paoA&filter[status]=NS&sort=starting_at&include=stage,localteam,visitorteam,runs,venue")!){ data , response, error in
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
