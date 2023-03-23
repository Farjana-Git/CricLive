//
//  SearchPlayerVC.swift
//  CricLive
//
//  Created by Bjit on 20/2/23.
//

import UIKit
import CoreData

class SearchPlayerVC: UIViewController {
    
    @IBOutlet weak var tableViewForSearchPlayer: UITableView!
    
    @IBOutlet weak var searchBar: UITextField!
    
    var search = " "
    
    var dataArray: Playerdata?
    
    var searchDataArray = [SearchPlayerEntity]()
    
    var arrayOfPlayer: [Playerdata] = []   //for detail player info
    var index: Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewForSearchPlayer.delegate = self
        tableViewForSearchPlayer.dataSource = self
        searchBar.delegate = self
        
        searchBarMethod()
 
    
        // MARK: need to check
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

         let fetchRequest: NSFetchRequest<SearchPlayerEntity> = SearchPlayerEntity.fetchRequest()
         let count = try? context.count(for: fetchRequest)
         if count == 0 {

             //APIcallerAndSaveDataInCoreData()
             searchDataArray = CoreDataManager.shared.getAllRecords(search: search)
             tableViewForSearchPlayer.reloadData()
         } else {
             // Core Data is not empty, no need to call API
             searchDataArray = CoreDataManager.shared.getAllRecords(search: search)
             tableViewForSearchPlayer.reloadData()

         }
        
}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "searchToPlayerInfo" {
            if let destinationVC = segue.destination as? PlayerInfoVC {
                destinationVC.playerId = Int(searchDataArray[index ?? 0].id)
            }
        }
        
    }
    
    
    func APIcallerAndSaveDataInCoreData() { APICallerForSearchPlayer.shared.fetchData { [weak self] data in
                guard let data = data else {
                    return
                    
                }
                CoreDataManager.shared.addItems(data: data)
        
                DispatchQueue.main.async {
                    self?.tableViewForSearchPlayer.reloadData()
                }
            }
    }
    
}

extension SearchPlayerVC {
    
    func searchBarMethod() {
        let searchIcon  = UIImageView()
        searchIcon.image = UIImage(systemName: "magnifyingglass")
        searchIcon.tintColor = .darkGray
        
        
        let uiView = UIView()
        uiView.addSubview(searchIcon)
        
        uiView.frame = CGRect(x: 0, y: 0, width: UIImage(systemName: "magnifyingglass")!.size.width+15, height: UIImage(systemName: "magnifyingglass")!.size.height)
        
        searchIcon.frame = CGRect(x:15, y: 0, width: UIImage(systemName: "magnifyingglass")!.size.width, height: UIImage(systemName: "magnifyingglass")!.size.height)
        
        searchBar.leftView = uiView
        searchBar.leftViewMode = .always
        searchBar.clearButtonMode = .whileEditing
        
    }
}

extension SearchPlayerVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        search = searchBar.text!
        searchDataArray = CoreDataManager.shared.getAllRecords(search: search)
        tableViewForSearchPlayer.reloadData()
        return true
    }
}

extension SearchPlayerVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        

        index = indexPath.row
        performSegue(withIdentifier: "searchToPlayerInfo", sender: nil)
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension SearchPlayerVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCellForSearchPlayer = tableViewForSearchPlayer.dequeueReusableCell(withIdentifier: "searchPlayerCellIdentifier", for: indexPath) as! SearchPlayerTVCell
        

        tableViewCellForSearchPlayer.searchedPlayerImgView.sd_setImage(with: URL(string: searchDataArray[indexPath.row].imagePath ?? ""), completed: nil)
        
        tableViewCellForSearchPlayer.searchedPlayerNameLabel.text = searchDataArray[indexPath.row].fullname
        
        return tableViewCellForSearchPlayer
    }
    
    
}
