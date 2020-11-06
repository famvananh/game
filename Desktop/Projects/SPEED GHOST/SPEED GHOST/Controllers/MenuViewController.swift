//
//  MenuViewController.swift
//  SPEED GHOST
//
//  Created by Fam Van Anh on 9/25/20.
//  Copyright © 2020 Fam Van Anh. All rights reserved.
//

import UIKit
import AVFoundation

class MenuViewController: UIViewController {

    @IBOutlet weak var lblBestScore: UILabel!

    var avPlayer: AVPlayer!
    var avPlayerLayer: AVPlayerLayer!
    var paused: Bool = false

    override func viewDidLoad() {

        let theURL = Bundle.main.url(forResource:"a", withExtension: "mp4")

        avPlayer = AVPlayer(url: theURL!)
        avPlayerLayer = AVPlayerLayer(player: avPlayer)
        avPlayerLayer.videoGravity = .resizeAspectFill
        avPlayer.volume = 0
        avPlayer.actionAtItemEnd = .none

        avPlayerLayer.frame = view.layer.bounds
        view.backgroundColor = .clear
        view.layer.insertSublayer(avPlayerLayer, at: 0)

        NotificationCenter.default.addObserver(self,
                                           selector: #selector(playerItemDidReachEnd(notification:)),
                                           name: .AVPlayerItemDidPlayToEndTime,
                                           object: avPlayer.currentItem)
    }

    @objc func playerItemDidReachEnd(notification: Notification) {
        let p: AVPlayerItem = notification.object as! AVPlayerItem
        p.seek(to: .zero)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        avPlayer.play()
        paused = false
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        avPlayer.pause()
        paused = true
    }
      
    @IBAction func btnPlay(_ sender: UIButton) {
        let controll = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController

        controll.modalPresentationStyle = .fullScreen
              self.present(controll,animated: true , completion: nil)
    }
    
    @IBAction func btnSettings(_ sender: Any) {
        let controll = storyboard?.instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController

        controll.modalPresentationStyle = .fullScreen
              self.present(controll,animated: true , completion: nil)
        
    }
    @IBAction func btnScore(_ sender: UIButton) {
        let controll = storyboard?.instantiateViewController(withIdentifier: "ScoreViewController") as! ScoreViewController
        self.present(controll,animated: true , completion: nil)
//        controll.modalPresentationStyle = .fullScreen
//        self.present(controll,animated: true , completion: nil)

    }
    
    func assignbackground(){
           let background = UIImage(named: "SG.jpg")

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
