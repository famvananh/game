//
//  ScoreViewController.swift
//  SPEED GHOST
//
//  Created by Fam Van Anh on 10/9/20.
//  Copyright © 2020 Fam Van Anh. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {

    @IBOutlet weak var lblCurrentScore: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var higthScore: UILabel!
    var array = StorageManager.shared.load()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        assignbackground()
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
    func show(){
        guard let obj = StorageManager.shared.load().last else {return}
        self.lblCurrentScore.text = String(obj.score!)
        let higthScore = UserDefaults.standard.integer(forKey: "Record")
        self.higthScore.text = String(higthScore)
    }
    
//    @IBAction func reloadData(_ sender: UIButton) {
//        self.dismiss(animated: false, completion: nil)
//        self.presentingViewController?.dismiss(animated: false, completion: nil)
//
//
//    }
    
    @IBAction func resetData(_ sender: UIButton) {
        let domiain = Bundle.main.bundleIdentifier!
               UserDefaults.standard.removePersistentDomain(forName: domiain)
        self.tableView.reloadData()
        
    }
    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//      if editingStyle == .delete {
//        print("Deleted")
//        
//        let domiain = Bundle.main.bundleIdentifier!
//        UserDefaults.standard.removePersistentDomain(forName: domiain)
//        UserDefaults.standard.synchronize()
//
//        self.array.remove(at: indexPath.row)
//        self.tableView.deleteRows(at: [indexPath], with: .automatic)
//      }
//    }
    
    
    

}

extension ScoreViewController:UITableViewDelegate,UITableViewDataSource {
    
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return array.count
}
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
//        self.tableView.reloadData()
        cell.configure(with: array[indexPath.row])
        
          return cell
}

        
    
  
}
