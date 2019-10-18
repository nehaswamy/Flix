//
//  PhotoTableViewCell.swift
//  Flix
//
//  Created by Neha Swamy on 10/13/19.
//  Copyright © 2019 Neha Swamy. All rights reserved.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {
    @IBOutlet weak var photoCell: PhotoTableViewCell!
    @IBOutlet var posterView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var synopsisLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
