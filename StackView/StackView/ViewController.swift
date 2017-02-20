//
//  ViewController.swift
//  StackView
//
//  Created by Sierra 4 on 10/02/17.
//  Copyright © 2017 code-brew. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var btnClickToFly: UIButton!
    @IBOutlet weak var lblFlying: UILabel!
    
    override func viewDidLoad() {
        //write your code here
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.btnClickToFly(_:)))
        btnClickToFly.addGestureRecognizer(tapGesture)
        
    }
    func tapBlurButton(sender: UITapGestureRecognizer) {
        btnClickToFly.setTitle("Help!!!", for: .normal)
    }
    
    @IBAction func btnClickToFly(_ sender: Any) {
        UIView.animate(withDuration: 1, animations: {
            self.lblFlying.transform = CGAffineTransform.init(translationX: 80, y: -80)
        }) { (true) in
            UIView.animate(withDuration: 1) {
                self.lblFlying.transform = CGAffineTransform.init(translationX: 0, y: 0)
            }
        }
        
        //animation for fade in fade out
        UIView.animate(withDuration: 1.0, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.btnClickToFly.alpha = 0.0
        }, completion: {
            (finished: Bool) -> Void in
            
            //Once the label is completely invisible, set the text and fade it back in
            self.btnClickToFly.setTitle("Faded!!!", for: .normal)
            self.btnClickToFly.backgroundColor = UIColor.red
            self.lblFlying.backgroundColor = UIColor.cyan
            
            // Fade in
            UIView.animate(withDuration: 1.0, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
                self.btnClickToFly.alpha = 1.0
            }, completion: nil)
        })
        
        //animation for stretching the button
        UIView.animate(withDuration: 0.6,
                       animations: {
                        self.btnClickToFly.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        },
                       completion: { _ in
                        UIView.animate(withDuration: 0.6) {
                            self.btnClickToFly.transform = CGAffineTransform.identity
                        }
        })
    }
}
