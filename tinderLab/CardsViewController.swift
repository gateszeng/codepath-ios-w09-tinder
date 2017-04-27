//
//  CardsViewController.swift
//  tinderLab
//
//  Created by Gates Zeng on 4/26/17.
//  Copyright © 2017 Gates Zeng. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
    @IBOutlet weak var navbarView: UIImageView!
    @IBOutlet weak var cardView: UIImageView!
    @IBOutlet weak var actionView: UIImageView!

    var cardInitialCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // creating a gesture recognizer and passing in the event handler
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(didPan(sender:)))
        
        // attaching gesture recognizer to view
        cardView.isUserInteractionEnabled = true
        cardView.addGestureRecognizer(panGestureRecognizer)
        
        // save the initial card position
        cardInitialCenter = cardView.center
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // event handler method
    func didPan(sender: UIPanGestureRecognizer) {
        let location = sender.location(in: view)
        let velocity = sender.velocity(in: view)
        let translation = sender.translation(in: view)
        
        if sender.state == .began {
            
        } else if sender.state == .changed {
            let degree = 0.75
            
            // move the card
            cardView.center = CGPoint(x: cardInitialCenter.x + translation.x, y: cardInitialCenter.y)
            
            // rotate from top
            if location.y < cardView.frame.maxY / 2 {
                // top rotating clockwise
                if velocity.x > 0 {
                    print("rotating right")
                    cardView.transform = cardView.transform.rotated(by: CGFloat(degree * M_PI / 180))
                // top rotatating counter clockwise
                } else {
                    print("rotating left")
                    cardView.transform = cardView.transform.rotated(by: CGFloat(-degree * M_PI / 180))
                }
            // rotate from bottom
            } else {
                // bottom rotating counter clockwise
                if velocity.x > 0 {
                    print("rotating left")
                    cardView.transform = cardView.transform.rotated(by: CGFloat(-degree * M_PI / 180))
                // bottom rotatating clockwise
                } else {
                    print("rotating right")
                    cardView.transform = cardView.transform.rotated(by: CGFloat(degree * M_PI / 180))
                }

            }
            
            
        } else if sender.state == .ended {
            
            if translation.x > CGFloat(50) {
                UIView.animate(withDuration: 0.1) {
                    self.cardView.center.x = self.cardInitialCenter.x + 500
                }
            } else if translation.x < CGFloat(-50) {
                UIView.animate(withDuration: 0.1) {
                    self.cardView.center.x = self.cardInitialCenter.x - 500
                }
            } else {
                // return to the original position
                UIView.animate(withDuration: 0.1) {
                    self.cardView.center = self.cardInitialCenter
                    self.cardView.transform = CGAffineTransform.identity
                }
            }
        }
    }
    
    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "profileSegue", sender: nil)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "profileSegue" {
            let profileVC = segue.destination as! ProfileViewController
            profileVC.profileImage = self.cardView.image
        }

    }
    

}
