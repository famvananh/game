//
//  SettingsViewController.swift
//  SPEED GHOST
//
//  Created by Fam Van Anh on 9/29/20.
//  Copyright © 2020 Fam Van Anh. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
  
    
    @IBOutlet weak var inputNameUser: UITextField!
    @IBOutlet weak var browCar: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        assignbackground()
    }
 
    @IBAction func saveData(_ sender: UIButton) {
         self.dismiss(animated: false, completion: nil)
         self.presentingViewController?.dismiss(animated: false, completion: nil)
    }
    @IBAction func choosedYellowCar(_ sender: UIButton) {
        guard let car = UIImage(named: "Car-3.png") else {return}
        StorageManager.shared.saveImage(image: car)
        browCar.layer.borderColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 1)
        browCar.layer.borderWidth = 3
    }
    
    @IBAction func choosedBrownCar(_ sender: UIButton) {
        guard let car = UIImage(named: "abc") else {return}
               StorageManager.shared.saveImage(image: car)
               browCar.layer.borderColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 1)
               browCar.layer.borderWidth = 3
        
    }
    
    @IBAction func choosedBlueCar(_ sender: UIButton) {
        guard let car = UIImage(named: "Car-1.png") else {return}
               StorageManager.shared.saveImage(image: car)
               browCar.layer.borderColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 1)
               browCar.layer.borderWidth = 3
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
