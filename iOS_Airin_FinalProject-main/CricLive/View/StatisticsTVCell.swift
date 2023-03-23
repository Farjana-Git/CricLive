//
//  StatisticsTVCell.swift
//  CricLive
//
//  Created by Bjit on 23/2/23.
//

import UIKit


class StatisticsTVCell: UITableViewCell {
    
    @IBOutlet weak var totalMatchLabel: UILabel!
    @IBOutlet weak var totalMatchDescLabel: UILabel!
    
    @IBOutlet weak var totalOverRunScoredLabel: UILabel!
    @IBOutlet weak var totalOverRunScoredDescLabel: UILabel!
    
    @IBOutlet weak var totalMediansNotoutLabel: UILabel!
    @IBOutlet weak var totalMediansNotoutDescLabel: UILabel!
    
    @IBOutlet weak var totalRunsBallsFacedLabel: UILabel!
    @IBOutlet weak var totalRunsBallsFacedDescLabel: UILabel!
    
    @IBOutlet weak var totalWicketsFour_xLabel: UILabel!
    @IBOutlet weak var totalWicketsFour_xDescLabel: UILabel!
    
    @IBOutlet weak var totalWideSix_xLabel: UILabel!
    @IBOutlet weak var totalWideSix_xDescLabel: UILabel!
    
    @IBOutlet weak var TotalNoballHundredLabel: UILabel!
    @IBOutlet weak var TotalNoballHundredDescLabel: UILabel!
    
    
    
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
