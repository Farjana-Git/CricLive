//
//  AllPlayersAPI.swift
//  CricLive
//
//  Created by Bjit on 14/2/23.
//

import Foundation

class APICallerForAllPlayers {
    
    
    static let shared = APICallerForAllPlayers()
    private init(){}
    
    
    func fetchData(completion: @escaping (AllPlayers?) -> Void) {
        var dataArray: AllPlayers?
        
        let task = URLSession.shared.dataTask(with: URL(string: "https://cricket.sportmonks.com/api/v2.0/players?api_token=6Byp8B6g0Q6mBZKKY0UHdapPRNHZpuKVMlZwwpALeacfNIZ73BABOQdMm9Pq")!){ data , response, error in
            if let error = error {
                print("Server Not found \(error.localizedDescription)")
            }
            else{
                guard let data = data else {
                    return
                }
                print(data)
                do{
                    let news = try JSONDecoder().decode(
                        AllPlayers.self, from: data)
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
