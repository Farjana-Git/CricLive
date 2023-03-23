//
//  APIForSquadList.swift
//  CricLive
//
//  Created by Bjit on 17/2/23.
//

import Foundation

class APICallerForSqude {
     
     
     static let shared = APICallerForSqude()
     private init(){}
     
     
    func fetchData(fixtureID: Int, completion: @escaping (Squad?) -> Void) {
         var dataArray: Squad?
         
         let task = URLSession.shared.dataTask(with: URL(string: "https://cricket.sportmonks.com/api/v2.0/fixtures/\(fixtureID)?api_token=lxezl1ffokmml78XFBGxCVjRkzD7SpjhWEhIMXgL6TyKi5QCgHvuBdV9paoA&fields[players]=fullname,image_path&include=lineup")!){ data, response, error in
             if let error = error {
                 print("Server Not found \(error.localizedDescription)")
             }
             else{
                 guard let data = data else {
                     return
                 }
                 print(data)
                 do{
                     let news = try JSONDecoder().decode(Squad.self, from: data)
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
