//
//  UserPlantList.swift
//  Wudder-Me
//
//  Created by Liana Norman on 9/17/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import Foundation

class UserPlantList {
   static var usersPlants = [Plant]()
    
    static func addPlantToUserList(plant: Plant)  -> [Plant] {
        usersPlants.append(plant)
        return usersPlants
    }
    
    
}
