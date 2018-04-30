//
//  CustomNavController.swift
//  AstroApp
//
//  Created by Alexandru Vladut on 30/04/2018.
//  Copyright © 2018 Alexandru Vladut. All rights reserved.
//

import UIKit

import Firebase
import FirebaseAuthUI
import FirebaseGoogleAuthUI
import FirebaseFacebookAuthUI


class CustomNavController: UINavigationController {

    let providers: [FUIAuthProvider] = [
        FUIGoogleAuth(),
        FUIFacebookAuth()
    ]
    var authUI:FUIAuth?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configFirebaseAuth()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       // handleLogin()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func handleLogin () {
        
        if Auth.auth().currentUser != nil {
            //if there ie a logged user, start syncing with the server
            
            
        } else {
            //present the login screen
            self.presentLoginVC()
        }
    }
    
    func configFirebaseAuth() {
        authUI = FUIAuth.defaultAuthUI()
        authUI?.delegate = self
        authUI?.providers = providers
        
        Auth.auth().addStateDidChangeListener {[weak self] auth, user in
            if user != nil {
                print("User is signed in.")
                self?.performSegue(withIdentifier: SegueId.toSyncScreen.rawValue, sender: nil)
            } else {
                print("User is signed out.")
                self?.presentLoginVC()
            }
        }
    }
    
    func presentLoginVC () {
        let authViewController = authUI!.authViewController()
        self.present(authViewController, animated: true) {
            
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

extension CustomNavController:FUIAuthDelegate{
    func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error: Error?) {
        // handle user and error as necessary
    }
    
    func application(_ app: UIApplication, open url: URL,
                     options: [UIApplicationOpenURLOptionsKey : Any]) -> Bool {
        let sourceApplication = options[UIApplicationOpenURLOptionsKey.sourceApplication] as! String?
        if FUIAuth.defaultAuthUI()?.handleOpen(url, sourceApplication: sourceApplication) ?? false {
            return true
        }
        // other URL handling goes here.
        return false
    }
}
