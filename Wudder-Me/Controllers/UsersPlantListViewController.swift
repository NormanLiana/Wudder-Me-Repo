//
//  UsersPlantListViewController.swift
//  Wudder-Me
//
//  Created by Liana Norman on 9/16/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import UIKit

class UsersPlantListViewController: UIViewController {
   
    
    // MARK: Outlets
    @IBOutlet weak var userPlantSearchOutlet:
    UISearchBar!
    @IBOutlet weak var userPlantListingsOutlet: UITableView!
    
    // MARK: Properties
    var userPlantList: UserPlantList! {
        didSet {
            userPlantListingsOutlet.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userPlantListingsOutlet.dataSource = self
        
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
    
    
}

extension UsersPlantListViewController: UITableViewDelegate {
    
}


