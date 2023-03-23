//
//  APIForSearchPlayer.swift
//  CricLive
//
//  Created by Bjit on 20/2/23.
//

import Foundation

class APICallerForSearchPlayer {
     
     static let shared = APICallerForSearchPlayer()
     private init(){}
     
     func fetchData(completion: @escaping (PlayersData?) -> Void) {
         var dataArray: PlayersData?
         
         let task = URLSession.shared.dataTask(with: URL(string: "https://cricket.sportmonks.com/api/v2.0/players?fields[players]=fullname,image_path,id&include=country&api_token=6Byp8B6g0Q6mBZKKY0UHdapPRNHZpuKVMlZwwpALeacfNIZ73BABOQdMm9Pq")!){ data , response, error in
             if let error = error {
                 print("Server Not found \(error.localizedDescription)")
             }
             else{
                 guard let data = data else {
                     return
                 }
                 print(data)
                 do{
                     let news = try JSONDecoder().decode(PlayersData.self, from: data)
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
