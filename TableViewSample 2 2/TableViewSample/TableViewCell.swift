//
//  TableViewCell.swift
//  TableViewSample
//
//  Created by iReaper on 06/02/17.
//  Copyright © 2017 Codebrew. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    
    
    
    var student : Students? {
        
        didSet{
            updateCell()
        }
        
    }
    
    
    fileprivate func updateCell(){
        
        // We have to all the logic here to calculate
        
        lblTitle?.text = student?.title
        lblDesc?.text = student?.desc
        
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
