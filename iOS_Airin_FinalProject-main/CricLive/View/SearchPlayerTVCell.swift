//
//  SearchPlayerTVCell.swift
//  CricLive
//
//  Created by Bjit on 20/2/23.
//

import UIKit

class SearchPlayerTVCell: UITableViewCell {
    
    
    @IBOutlet weak var searchedPlayerImgView: UIImageView!
    
    @IBOutlet weak var searchedPlayerNameLabel: UILabel!
    
    @IBOutlet weak var searchedPlayerCountryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        searchedPlayerImgView.layer.cornerRadius = 25
        searchedPlayerImgView.layer.masksToBounds = true


    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //to make the gap between cells
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 3, left: 2, bottom: 3, right: 2))
        
        //to give the corner radious
        contentView.layer.cornerRadius = 20
        contentView.layer.masksToBounds = true
    }

}
