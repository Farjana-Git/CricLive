//
//  SquadListTVCell.swift
//  CricLive
//
//  Created by Bjit on 17/2/23.
//

import UIKit

class SquadListTVCell: UITableViewCell {

    @IBOutlet weak var squadImgView: UIImageView!
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var playerPositionName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
       
        squadImgView.layer.cornerRadius = 60
        squadImgView.layer.masksToBounds = true
       
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 3, left: 2, bottom: 3, right: 2))
    
        contentView.layer.cornerRadius = 20
        contentView.layer.masksToBounds = true
    }

}
