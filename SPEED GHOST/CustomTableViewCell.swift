//
//  CustomTableViewCell.swift
//  SPEED GHOST
//
//  Created by Fam Van Anh on 10/9/20.
//  Copyright © 2020 Fam Van Anh. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {


    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var date: UILabel!
    
    func configure (with object :Result){
        self.label.text = String(object.score!)
        self.date.text = object.date
   }
    

}
