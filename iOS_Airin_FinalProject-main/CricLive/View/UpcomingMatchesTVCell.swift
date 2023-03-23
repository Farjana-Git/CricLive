//
//  UpcomingMatchesTVCell.swift
//  CricLive
//
//  Created by Bjit on 14/2/23.
//

import UIKit

class UpcomingMatchesTVCell: UITableViewCell {
    
    @IBOutlet weak var localTeamImgView: UIImageView!
    @IBOutlet weak var visitorTeamImgView: UIImageView!
    
    @IBOutlet weak var gameTypeLabel: UILabel!
    
    @IBOutlet weak var localTeamNameLabel: UILabel!
    @IBOutlet weak var visitorTeamNameLabel: UILabel!
    
    @IBOutlet weak var venueLabel: UILabel!
    
    
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
