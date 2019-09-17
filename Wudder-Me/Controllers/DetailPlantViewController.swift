//
//  DetailPlantViewController.swift
//  Wudder-Me
//
//  Created by Liana Norman on 9/16/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import UIKit

class DetailPlantViewController: UIViewController {

    
    @IBOutlet weak var plantImageOutlet:
    UIImageView!
    @IBOutlet weak var plantNameOutlet:
    UILabel!
    @IBOutlet weak var plantDescriptionOutlet: UITextView!
    
    // MARK: Properties
    var plant: Plant!
    
    // MARK: Button Actions
    @IBAction func createPlantButton(_ sender: UIButton) {
       var _ = UserPlantList.addPlantToUserList(plant: plant)
        
    }
    
    // MARK: Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is UsersPlantListViewController {
            guard let userListVC = segue.destination as? UsersPlantListViewController else {
                return
            }
        }
    }
    
    // MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()

    }
    
    private func setUpViews() {
        plantNameOutlet.text = plant.name
        plantDescriptionOutlet.text = plant.description
        getImage()
    }
    
    private func getImage() {
        let imageURL = plant.image[0].url
        ImageManager.getImage(stringURL: imageURL) { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let data):
                DispatchQueue.main.async {
                    self.plantImageOutlet.image = data
                }
            }
        }
    }
}
