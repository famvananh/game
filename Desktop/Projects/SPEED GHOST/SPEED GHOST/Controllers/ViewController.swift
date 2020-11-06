//
//  ViewController.swift
//  SPEED GHOST
//
//  Created by Fam Van Anh on 9/16/20.
//  Copyright © 2020 Fam Van Anh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var firtRoad: UIImageView!
    @IBOutlet weak var secondRoad: UIImageView!
    @IBOutlet weak var thirdRoad: UIImageView!
    @IBOutlet weak var fourthRoad: UIImageView!
    @IBOutlet weak var fifthRoad: UIImageView!
    @IBOutlet weak var sixthRoad: UIImageView!
    @IBOutlet weak var seventhRoad: UIImageView!
    @IBOutlet weak var eighthRoad: UIImageView!
    @IBOutlet weak var ninthRoad: UIImageView!
    @IBOutlet weak var tenthRoad: UIImageView!
    @IBOutlet weak var eleventhRoad: UIImageView!
 
    @IBOutlet weak var firtCar: UIImageView!
    @IBOutlet weak var secondCar: UIImageView!
    @IBOutlet weak var userCar: UIImageView!
    
    
    @IBOutlet weak var firtTree: UIImageView!
    @IBOutlet weak var secondTree: UIImageView!
    @IBOutlet weak var thirdTree: UIImageView!
    @IBOutlet weak var fourthTree: UIImageView!
    @IBOutlet weak var fifthTree: UIImageView!
    @IBOutlet weak var sixthTree: UIImageView!
    
    @IBOutlet weak var lblScore: UILabel!
    
    
    var screenHeight:CGFloat!
    var timer:Timer?
    var screenWidth:CGFloat!
    var screenWidthMaxX:CGFloat!
    var screenWidthMinX:CGFloat!
    var secondTimer:Timer?
    var screenWidthView = UIScreen.main.bounds.width
    var centerView:CGFloat!
    
    var recordData:String!
    private var points = Int()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screenWidth = self.view.frame.size.width
        screenWidthMaxX = self.view.frame.maxX
        screenWidthMinX = self.view.frame.minX
        centerView =  self.view.frame.size.width / self.view.frame.size.height
        screenHeight = self.view.frame.maxY
         
        timer = Timer.scheduledTimer(timeInterval: 0.005, target: self, selector: #selector(roadMove), userInfo: nil, repeats: true)
        
        secondTimer = Timer.scheduledTimer(timeInterval: 0.005, target: self, selector: #selector(carMove), userInfo: nil, repeats: true)
        timer = Timer.scheduledTimer(timeInterval: 0.005, target: self, selector: #selector(treeMove), userInfo: nil, repeats: true)
               
        
        firtCar.frame = CGRect(x: firtCar.frame.origin.x, y: firtCar.frame.origin.y - 600, width: firtCar.frame.size.width, height: firtCar.frame.size.height)
        secondCar.frame = CGRect(x: secondCar.frame.origin.x, y: secondCar.frame.origin.y - 600, width: secondCar.frame.size.width, height: secondCar.frame.size.height)
       
        self.userCar.image = StorageManager.shared.loadSave(fileName: "cars")
             endGame()
    }
    func endGame(){
            if  userCar.frame.maxX > self.view.frame.maxX || userCar.frame.minX <  self.view.frame.minX || firtCar.frame.intersects(userCar.frame) || secondCar.frame.intersects(userCar.frame) ||
                firtCar.frame.intersects(firtTree.frame) || secondCar.frame.intersects(firtTree.frame) ||
                firtCar.frame.intersects(secondTree.frame) || secondCar.frame.intersects(secondTree.frame) ||
                firtCar.frame.intersects(thirdTree.frame) || secondCar.frame.intersects(thirdTree.frame) ||
                firtCar.frame.intersects(fourthTree.frame) || secondCar.frame.intersects(fourthTree.frame) ||
                firtCar.frame.intersects(fifthTree.frame) || secondCar.frame.intersects(fifthTree.frame) ||
                firtCar.frame.intersects(sixthTree.frame) || secondCar.frame.intersects(sixthTree.frame)
        {
            timer!.invalidate()
            secondTimer!.invalidate()

            let controll = self.storyboard?.instantiateViewController(withIdentifier: "EndViewController") as! EndViewController
            controll.scoreData = lblScore.text
            self.present(controll,animated: true,completion: nil)
            let currentUser = StorageManager.shared.load().last?.name
            let date = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            let obj = Result(name: currentUser, score: UserDefaults.standard.integer(forKey: "scoreKey"),  date:dateFormatter.string(from: date))
            StorageManager.shared.save(object: obj)
            print(points)
        }
        
    }
    @objc func treeMove(){
        firtTree.frame = CGRect(x: firtTree.frame.origin.x, y: firtTree.frame.origin.y + 1 , width: firtTree.frame.size.width, height: firtTree.frame.size.height)
            if firtTree.frame.origin.y == screenHeight{
            firtTree.frame.origin.y = 0
            }
        secondTree.frame = CGRect(x: secondTree.frame.origin.x, y: secondTree.frame.origin.y + 1 , width: secondTree.frame.size.width, height: secondTree.frame.size.height)
                   if secondTree.frame.origin.y == screenHeight{
                   secondTree.frame.origin.y = 0
                   }
        thirdTree.frame = CGRect(x: thirdTree.frame.origin.x, y: thirdTree.frame.origin.y + 1 , width: thirdTree.frame.size.width, height: thirdTree.frame.size.height)
                   if thirdTree.frame.origin.y == screenHeight{
                   thirdTree.frame.origin.y = 0
                   }
        fourthTree.frame = CGRect(x: fourthTree.frame.origin.x, y: fourthTree.frame.origin.y + 1 , width: fourthTree.frame.size.width, height: fourthTree.frame.size.height)
                   if fourthTree.frame.origin.y == screenHeight{
                   fourthTree.frame.origin.y = 0
                   }
        fifthTree.frame = CGRect(x: fifthTree.frame.origin.x, y: fifthTree.frame.origin.y + 1 , width: fifthTree.frame.size.width, height: fifthTree.frame.size.height)
                   if fifthTree.frame.origin.y == screenHeight{
                   fifthTree.frame.origin.y = 0
                   }
        sixthTree.frame = CGRect(x: sixthTree.frame.origin.x, y: sixthTree.frame.origin.y + 1 , width: sixthTree.frame.size.width, height: sixthTree.frame.size.height)
                   if sixthTree.frame.origin.y == screenHeight{
                   sixthTree.frame.origin.y = 0
                   }
        
    }
    
    @IBAction func controllUserCar(_ regconizer: UIPanGestureRecognizer) {
        guard let regconizerView = regconizer.view else {
                   return
               }
               let translator = regconizer.translation(in: view)
               regconizerView.center.x += translator.x
               regconizer.setTranslation(.zero, in: view)
               if regconizer.state == .ended{
               endGame()
            
        }
        
    }
    
    @objc func carMove(){

                let numberForFirtCar = CGFloat.random(in: 0...150)
                let numberForSecondCar = CGFloat.random(in: 150...300)
        
                firtCar.frame = CGRect(x: firtCar.frame.origin.x , y: firtCar.frame.origin.y + 1, width: firtCar.frame.size.width, height: firtCar.frame.size.height)

                if firtCar.frame.origin.y == 400{
                    animation(viewAnimation: firtCar)
                }
                if  firtCar.frame.origin.y == screenHeight {
                    firtCar.frame = CGRect(x:numberForFirtCar , y: 0 , width: firtCar.frame.size.width, height: firtCar.frame.size.height)
                    points += 1
                    lblScore.text = String(points)
                   

                }

                secondCar.frame = CGRect(x: secondCar.frame.origin.x, y: secondCar.frame.origin.y + 1, width: secondCar.frame.size.width, height: secondCar.frame.size.height)
                
                if secondCar.frame.origin.y == screenHeight {
                   secondCar.frame = CGRect(x:numberForSecondCar , y: 0 , width: secondCar.frame.size.width, height: secondCar.frame.size.height)
                           points += 1
                      lblScore.text = String(points)
                       }
        let defaults = UserDefaults.standard
        var highScore = defaults.integer(forKey: "scoreKey")

        if  points > highScore {
            highScore = points
            let defaults = UserDefaults.standard
            defaults.set(highScore, forKey: "scoreKey")

        }
      if  firtCar.frame.intersects(userCar.frame) || secondCar.frame.intersects(userCar.frame)
        {
        timer!.invalidate()
        secondTimer!.invalidate()
        }

    }
    
    
    @objc func roadMove (){
        firtRoad.frame = CGRect(x: firtRoad.frame.origin.x, y: firtRoad.frame.origin.y + 1 , width: firtRoad.frame.size.width, height: firtRoad.frame.size.height)
        if firtRoad.frame.origin.y == screenHeight{
        firtRoad.frame.origin.y = 0
        }
        secondRoad.frame = CGRect(x: secondRoad.frame.origin.x, y: secondRoad.frame.origin.y + 1 , width: secondRoad.frame.size.width, height: secondRoad.frame.size.height)
        if secondRoad.frame.origin.y == screenHeight{
        secondRoad.frame.origin.y = 0
        }
        thirdRoad.frame = CGRect(x: thirdRoad.frame.origin.x, y: thirdRoad.frame.origin.y + 1 , width: thirdRoad.frame.size.width, height: thirdRoad.frame.size.height)
        if thirdRoad.frame.origin.y == screenHeight{
        thirdRoad.frame.origin.y = 0
        }
        fourthRoad.frame = CGRect(x: fourthRoad.frame.origin.x, y: fourthRoad.frame.origin.y + 1 , width: fourthRoad.frame.size.width, height: fourthRoad.frame.size.height)
        if fourthRoad.frame.origin.y == screenHeight{
        fourthRoad.frame.origin.y = 0
        }
        fifthRoad.frame = CGRect(x: fifthRoad.frame.origin.x, y: fifthRoad.frame.origin.y + 1 , width: fifthRoad.frame.size.width, height: fifthRoad.frame.size.height)
        if fifthRoad.frame.origin.y == screenHeight{
        fifthRoad.frame.origin.y = 0
        }
        sixthRoad.frame = CGRect(x: sixthRoad.frame.origin.x, y: sixthRoad.frame.origin.y + 1 , width: sixthRoad.frame.size.width, height: sixthRoad.frame.size.height)
        if sixthRoad.frame.origin.y == screenHeight{
        sixthRoad.frame.origin.y = 0
        }
        seventhRoad.frame = CGRect(x: seventhRoad.frame.origin.x, y: seventhRoad.frame.origin.y + 1 , width: seventhRoad.frame.size.width, height: seventhRoad.frame.size.height)
        if seventhRoad.frame.origin.y == screenHeight{
        seventhRoad.frame.origin.y = 0
        }
        eighthRoad.frame = CGRect(x: eighthRoad.frame.origin.x, y: eighthRoad.frame.origin.y + 1 , width: eighthRoad.frame.size.width, height: eighthRoad.frame.size.height)
        if eighthRoad.frame.origin.y == screenHeight{
        eighthRoad.frame.origin.y = 0
        }
        ninthRoad.frame = CGRect(x: ninthRoad.frame.origin.x, y: ninthRoad.frame.origin.y + 1 , width: ninthRoad.frame.size.width, height: ninthRoad.frame.size.height)
        if ninthRoad.frame.origin.y == screenHeight{
        ninthRoad.frame.origin.y = 0
        }
        tenthRoad.frame = CGRect(x: tenthRoad.frame.origin.x, y: tenthRoad.frame.origin.y + 1 , width: tenthRoad.frame.size.width, height: tenthRoad.frame.size.height)
        if tenthRoad.frame.origin.y == screenHeight{
            tenthRoad.frame.origin.y = 0
        }
        eleventhRoad.frame = CGRect(x: eleventhRoad.frame.origin.x, y: eleventhRoad.frame.origin.y + 1 , width: eleventhRoad.frame.size.width, height: eleventhRoad.frame.size.height)
        if eleventhRoad.frame.origin.y == screenHeight{
            eleventhRoad.frame.origin.y = 0
        }
    }
    
    private func animation(viewAnimation:UIImageView) {
           UIImageView.animate(withDuration: 2, animations: {
               viewAnimation.frame.origin.x = +viewAnimation.frame.width
           }) { (_) in
               UIView.animate(withDuration: 2, delay: 1, options: [.curveEaseIn], animations: {
                   viewAnimation.frame.origin.x -= viewAnimation.frame.width
               })

           }
       }
    func ani(){
        
    }

}

