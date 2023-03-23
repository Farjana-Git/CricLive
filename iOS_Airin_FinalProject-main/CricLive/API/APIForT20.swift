//
//  APIForT20.swift
//  CricLive
//
//  Created by Bjit on 21/2/23.
//

import Foundation

class APICallerForT20 {
     
     static let shared = APICallerForT20()
     private init(){}
     
    func fetchData(type: String, completion: @escaping (Teams?) -> Void) {
         var dataArray: Teams?
         
         let task = URLSession.shared.dataTask(with: URL(string: "https://cricket.sportmonks.com/api/v2.0/team-rankings?api_token=lxezl1ffokmml78XFBGxCVjRkzD7SpjhWEhIMXgL6TyKi5QCgHvuBdV9paoA&filter[type]=\(type)")!){ data , response, error in
             if let error = error {
                 print("Server Not found \(error.localizedDescription)")
             }
             else{
                 guard let data = data else {
                     return
                 }
                 print(data)
                 do{
                     let news = try JSONDecoder().decode(Teams.self, from: data)
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
