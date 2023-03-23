//
//  PlayerInfoTVCell.swift
//  CricLive
//
//  Created by Bjit on 21/2/23.
//

import UIKit

class PlayerInfoTVCell: UITableViewCell {
    
    @IBOutlet weak var bornLabel: UILabel!
    @IBOutlet weak var bornDescLabel: UILabel!
    
    @IBOutlet weak var battingStyleLabel: UILabel!
    @IBOutlet weak var battingStyleDescLabel: UILabel!
    
    @IBOutlet weak var bowlingStyleLabel: UILabel!
    @IBOutlet weak var bowlingStyleDescLabel: UILabel!
    
    @IBOutlet weak var roleLabel: UILabel!
    @IBOutlet weak var roleDescLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
