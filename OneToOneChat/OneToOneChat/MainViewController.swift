//
//  MainViewController.swift
//  OneToOneChat
//
//  Created by Nasrullah Khan on 28/01/2017.
//  Copyright © 2017 Nasrullah Khan. All rights reserved.
//

import UIKit
import RxSwift

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!

    var users = [String: User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        _ = User.allUsers.asObservable().subscribe { (userDict) in
            self.users = User.allUsers.value
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "allUserCellIdentifier", for: indexPath) as! AllUserCell
        
        let userObj = Array(users.values)[indexPath.row]
        
        cell.userName.text = userObj.name
        cell.contactNo.text = userObj.contactNo
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let userObj = Array(users.values)[indexPath.row]
        
        self.performSegue(withIdentifier: "showChatController", sender: userObj)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! ChatViewController
        dest.toUser = sender as? User
    }
 

}
