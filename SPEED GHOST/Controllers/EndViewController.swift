//
//  EndViewController.swift
//  SPEED GHOST
//
//  Created by Fam Van Anh on 9/29/20.
//  Copyright © 2020 Fam Van Anh. All rights reserved.
//

import UIKit

class EndViewController: UIViewController {
    var scoreData:String!
    @IBOutlet weak var lblScore: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
           lblScore.text = scoreData
           assignbackground()
        
    }
    @IBAction func btnRestartGame(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
        self.presentingViewController?.dismiss(animated: false, completion: nil)
    }
    func assignbackground(){
        let background = UIImage(named: "BG-1.jpg")

        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
    

   

}
