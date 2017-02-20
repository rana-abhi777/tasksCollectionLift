//
//  SectionItemsTableViewCell.swift
//  CollectionView
//
//  Created by Sierra 4 on 08/02/17.
//  Copyright © 2017 code-brew. All rights reserved.
//

import UIKit

class SectionItemsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblProductDiscount: UILabel!
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var lblProductWeight: UILabel!
    @IBOutlet weak var lblProductPrice: UILabel!
    @IBOutlet weak var imgProductImage: UIImageView!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
