//
//  PlantSearchViewController.swift
//  Wudder-Me
//
//  Created by Liana Norman on 9/16/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import UIKit

class PlantSearchViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var plantTableViewOutlet: UITableView!
    @IBOutlet weak var plantSearchBarOutlet:
    UISearchBar!
    
    // MARK: Properties
    var plants = [Plant]() {
        didSet {
            plantTableViewOutlet.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is DetailPlantViewController {
            guard let indexPath = plantTableViewOutlet.indexPathForSelectedRow,
                let plantsVC = segue.destination as? DetailPlantViewController else {
                    return
            }
            let onePlant = plants[indexPath.row]
            plantsVC.plant = onePlant
        }
    }
    
    // MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        plantTableViewOutlet.dataSource = self
        plantTableViewOutlet.delegate = self
        loadData()

    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
       dump(UserPlantList.usersPlants) 
    }
    
    // MARK: Private Methods
    private func loadData() {
        PlantAPTClient.manager.getPlants { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let plants):
                    self.plants = plants
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    
}

// MARK: Extensions
extension PlantSearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return plants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = plantTableViewOutlet.dequeueReusableCell(withIdentifier: "plantCell", for: indexPath)
        let imageURL = plants[indexPath.row].image[0].url
        ImageManager.getImage(stringURL: imageURL) { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let data):
                DispatchQueue.main.async {
                    cell.imageView?.image = data
                    
                    self.plantTableViewOutlet.reloadData()
                }
            }
        }
        cell.textLabel?.text = plants[indexPath.row].name
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Tap to view"
    }
}

extension PlantSearchViewController: UITableViewDelegate {
    
}
