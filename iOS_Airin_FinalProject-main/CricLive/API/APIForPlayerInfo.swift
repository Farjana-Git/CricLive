//
//  APIForPlayerInfo.swift
//  CricLive
//
//  Created by Bjit on 21/2/23.
//

import Foundation

class APICallerForPlayerInfo {
     
     static let shared = APICallerForPlayerInfo()
     private init(){}
     
    func fetchData(playerID: Int, completion: @escaping (PlayerInfo?) -> Void) {
         var dataArray: PlayerInfo?
         
         let task = URLSession.shared.dataTask(with: URL(string: "https://cricket.sportmonks.com/api/v2.0/players/\(playerID)?api_token=6Byp8B6g0Q6mBZKKY0UHdapPRNHZpuKVMlZwwpALeacfNIZ73BABOQdMm9Pq&fields[players]=fullname,image_path,id,dateofbirth,battingstyle,bowlingstyle,position&include=country")!){ data , response, error in
             if let error = error {
                 print("Server Not found \(error.localizedDescription)")
             }
             else{
                 guard let data = data else {
                     return
                 }
                 print(data)
                 do{
                     let news = try JSONDecoder().decode(PlayerInfo.self, from: data)
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
