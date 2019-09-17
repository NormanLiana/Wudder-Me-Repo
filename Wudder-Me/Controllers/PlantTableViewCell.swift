//
//  PlantTableViewCell.swift
//  Wudder-Me
//
//  Created by Bianca Brown on 9/17/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import UIKit

class PlantTableViewCell: UITableViewCell {

    
    @IBOutlet weak var plantImageOutlet: UIImageView!
    
    
    @IBOutlet weak var plantNameOutlet: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
