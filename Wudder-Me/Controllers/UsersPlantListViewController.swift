//
//  UsersPlantListViewController.swift
//  Wudder-Me
//
//  Created by Liana Norman on 9/16/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import UIKit
import UserNotifications

class UsersPlantListViewController: UIViewController {
   
    // MARK: Outlets
    @IBOutlet weak var userPlantSearchOutlet:
    UISearchBar!
    @IBOutlet weak var userPlantListingsOutlet: UITableView!
    let center = UNUserNotificationCenter.current()
    let content = UNMutableNotificationContent()
    // MARK: Timer variables
    var timer: Timer?
    
    
    
    // MARK: Properties
//    var userArray = UserPlantList.usersPlants {
//        didSet {
//            userPlantListingsOutlet.reloadData()
//        }
//    }
    var userPlantList: UserPlantList! {
        didSet {
            userPlantListingsOutlet.reloadData()
        }
    }
    
    var timeArr = [Int]()
//    var timeLeft = 60{
//        didSet{
//            userPlantListingsOutlet.reloadData()
//        }
//    }
    
    //MARK:  This is to delete an item by swiping left
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            center.removePendingNotificationRequests(withIdentifiers: [UserPlantList.usersPlants[indexPath.row].name])
            UserPlantList.usersPlants.remove(at: indexPath.row)
            userPlantListingsOutlet.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userPlantListingsOutlet.dataSource = self
        //center.removeAllDeliveredNotifications()
        center.removeAllPendingNotificationRequests()
        self.timeArr = UserPlantList.usersPlants.map({Int($0.duration)!})
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
        
    }
    
    //MARK: Time Function
    @objc func runTimer(){
       
        userPlantListingsOutlet.visibleCells.forEach { (cell) in
            let indexPath = userPlantListingsOutlet.indexPath(for: cell)
            let num = timeArr[(indexPath?.row)!]
            cell.updateWithTimer(time: num)
        }
        timeArr = timeArr.map{$0 - 1}
//        for i in timeArr{
//            if i <= 0 {
//                timer?.invalidate()
//            }
//        }
        
        //userPlantListingsOutlet.reloadData()
//        if timeLeft == 0 {
//            timer?.invalidate()
//            timer = nil
//        }
    }
}



// MARK: Extensions
extension UsersPlantListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return UserPlantList.usersPlants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = userPlantListingsOutlet.dequeueReusableCell(withIdentifier: "myListCell", for: indexPath)
        let onePlant = UserPlantList.usersPlants[indexPath.row]
        cell.textLabel?.text = onePlant.name
       
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "My Plants to Water"
    }

    
}

extension UsersPlantListViewController: UITableViewDelegate {
    
}


