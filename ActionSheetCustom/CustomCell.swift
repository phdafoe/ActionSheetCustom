//
//  CustomCell.swift
//  ActionSheetCustom
//
//  Created by Andres on 15/4/17.
//  Copyright © 2017 icologic. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var myImagenIcono: UIImageView!
    @IBOutlet weak var myNombreOpcion: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
