//
//  TeamRankTVCell.swift
//  CricLive
//
//  Created by Bjit on 21/2/23.
//

import UIKit

class TeamRankTVCell: UITableViewCell {
    
    @IBOutlet weak var typeLabel: UILabel!
    
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var ratingDescLabel: UILabel!
    
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var pointsDescLabel: UILabel!
    
    @IBOutlet weak var matchesLabel: UILabel!
    @IBOutlet weak var matchesDescLabel: UILabel!
    
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var positionDescLabel: UILabel!
    
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var teamLogoImgView: UIImageView!
    

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        teamLogoImgView.layer.cornerRadius = 40
        teamLogoImgView.layer.masksToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 3, left: 2, bottom: 3, right: 2))
  
        contentView.layer.cornerRadius = 20
        contentView.layer.masksToBounds = true
    }

}
