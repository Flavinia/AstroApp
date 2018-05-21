//
//  SyncWithServerVC.swift
//  AstroApp
//
//  Created by Alexandru Vladut on 30/04/2018.
//  Copyright © 2018 Alexandru Vladut. All rights reserved.
//

import UIKit
import Firebase

protocol TableViewModelDelegate : class {
    func testsUpdated()
}


class SyncWithServerVC: UIViewController {

    @IBOutlet weak var tbl: UITableView!
    var tableViewModel = TestListTableViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewModel.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func btnLogoutPressed(_ sender: Any) {
        tableViewModel.getTestsForLevel(1)
        /*
        do{
            try Auth.auth().signOut()
            
        }catch{
            print("Error while signing out!")
        }
 */
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

extension SyncWithServerVC:UITableViewDelegate{
    
}

extension SyncWithServerVC:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewModel.tests.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "testCell", for: indexPath) as? TestCell else {
            return UITableViewCell()
        }
        let nameString = tableViewModel.tests[indexPath.row].name
        cell.config(testName: nameString)
        return cell
    }
    
    
}

extension SyncWithServerVC:TableViewModelDelegate {
    func testsUpdated() {
        self.tbl.reloadData()
    }
    
    
}
