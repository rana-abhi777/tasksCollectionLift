//
//  Students.swift
//  TableViewSample
//
//  Created by iReaper on 06/02/17.
//  Copyright © 2017 Codebrew. All rights reserved.
//

import Foundation


class  Students {
    
    var title : String?
    var desc : String?
    var arrSubData : [String]?
    
    
    init(title : String? , desc : String?, arrSubData:[String]?) {
        self.title = title
        self.desc = desc
        self.arrSubData = arrSubData
    }
    
}
