//
//  AutolayoutViewController.swift
//  TableViewSample
//
//  Created by iReaper on 06/02/17.
//  Copyright © 2017 Codebrew. All rights reserved.
//

import UIKit

class AutolayoutViewController: UIViewController {

    @IBOutlet var viewShape: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func btnClick(_ sender: Any) {
        
        
        UIView.animate(withDuration: 1, animations: { 
            self.viewShape.transform = CGAffineTransform.init(translationX: 0, y: -80)
        }) { (true) in
            UIView.animate(withDuration: 1) {
                self.viewShape.transform = CGAffineTransform.init(translationX: 0, y: 0)
            }

        }
        
    }
    
}

