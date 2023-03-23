//
//  APIForStatistics.swift
//  CricLive
//
//  Created by Bjit on 23/2/23.
//

import Foundation


class APICallerForStatistics {
     
     static let shared = APICallerForStatistics()
     private init(){}
     
     func fetchData(playerID: Int, completion: @escaping (Statistics?) -> Void) {
         var dataArray: Statistics?
         
         let task = URLSession.shared.dataTask(with: URL(string: "https://cricket.sportmonks.com/api/v2.0/players/\(playerID)?api_token=lxezl1ffokmml78XFBGxCVjRkzD7SpjhWEhIMXgL6TyKi5QCgHvuBdV9paoA&include=career.season")!){ data , response, error in
             if let error = error {
                 print("Server Not found \(error.localizedDescription)")
             }
             else{
                 guard let data = data else {
                     return
                 }
                 print(data)
                 do{
                     let news = try JSONDecoder().decode(Statistics?.self, from: data)
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
