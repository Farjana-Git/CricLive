//
//  ScoreboardTVCell.swift
//  CricLive
//
//  Created by Bjit on 19/2/23.
//

import UIKit

class ScoreboardTVCell: UITableViewCell {
    
    @IBOutlet weak var batterNameLabel: UILabel!
    
    @IBOutlet weak var batterRunLabel: UILabel!
    
    @IBOutlet weak var batterBowlLabel: UILabel!
    
    @IBOutlet weak var fourLabel: UILabel!
    
    @IBOutlet weak var sixLabel: UILabel!
    
    @IBOutlet weak var srLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 3, left: 2, bottom: 3, right: 2))
        
        contentView.layer.cornerRadius = 20
        contentView.layer.masksToBounds = true
    }

}
