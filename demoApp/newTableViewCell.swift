//
//  newTableViewCell.swift
//  demoApp
//
//  Created by abc on 12/12/20.
//  Copyright © 2020 abc. All rights reserved.
//

import UIKit

class newTableViewCell: UITableViewCell {

    @IBOutlet weak var imageUrl: UIImageView!
    @IBOutlet weak var abstract: UILabel!
    @IBOutlet weak var byLine: UILabel!
    @IBOutlet weak var publishedDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        imageUrl.layer.cornerRadius = imageUrl.frame.height/2
        imageUrl.clipsToBounds = true
        // Configure the view for the selected state
    }

}
