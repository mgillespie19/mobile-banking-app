//
//  openView.swift
//  cardable
//
//  Created by Max Gillespie on 11/20/18.
//  Copyright © 2018 Max Gillespie. All rights reserved.
//

import UIKit

class openView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let welcome = UILabel(frame: CGRect(x: self.view.frame.width/16, y: self.view.frame.height/8, width: self.view.frame.width * 7 / 8, height: self.view.frame.height / 4))
        welcome.text = "welcome to cardable!"
        welcome.textColor = UIColor.white
        welcome.font = welcome.font.withSize(45)
        welcome.lineBreakMode = .byWordWrapping
        welcome.numberOfLines = 2
        welcome.alpha = 0
        
        self.view.addSubview(welcome)
        
        welcome.fadeIn(duration: 2, completion: {
            (finished: Bool) -> Void in
            
        })
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
