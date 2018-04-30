//
//  SyncWithServerVC.swift
//  AstroApp
//
//  Created by Alexandru Vladut on 30/04/2018.
//  Copyright © 2018 Alexandru Vladut. All rights reserved.
//

import UIKit
import Firebase

class SyncWithServerVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func btnLogoutPressed(_ sender: Any) {
        do{
            try Auth.auth().signOut()
            
        }catch{
            print("Error while signing out!")
        }
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
