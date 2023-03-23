//
//  RecentMatchesTVCell.swift
//  CricLive
//
//  Created by Bjit on 13/2/23.
//

import UIKit

class RecentMatchesTVCell: UITableViewCell {
    
    
    @IBOutlet weak var typeLabel: UILabel!
    
    @IBOutlet weak var localLogoImgView: UIImageView!
    @IBOutlet weak var visitorLogoImgView: UIImageView!

    @IBOutlet weak var localTeamLabel: UILabel!
    @IBOutlet weak var visitorTeamLabel: UILabel!
    
    @IBOutlet weak var localRunLabel: UILabel!
    @IBOutlet weak var visitorRunLabel: UILabel!
    
    @IBOutlet weak var localWicketLabel: UILabel!
    @IBOutlet weak var visitorWicketLabel: UILabel!
    
    @IBOutlet weak var noteLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
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
