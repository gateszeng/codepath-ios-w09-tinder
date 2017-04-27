//
//  ProfileViewController.swift
//  tinderLab
//
//  Created by Gates Zeng on 4/26/17.
//  Copyright © 2017 Gates Zeng. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var profileImageView: UIImageView!
    
    var profileImage: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImageView.image = profileImage
    
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
        print("dismissing")
        dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
