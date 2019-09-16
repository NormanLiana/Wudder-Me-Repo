//
//  PlantAPIClient.swift
//  Wudder-Me
//
//  Created by Liana Norman on 9/16/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import Foundation

struct PlantAPTClient {
    static let manager = PlantAPTClient()
    
    func getPlants(completionHandler: @escaping (Result<[Plant], AppError>) -> () ) {
        NetworkManager.manager.performDataTask(url: airTablePlantURL, httpMethod: .get) { (result) in
            switch result {
            case .failure(let error):
                return
            case .success(let data):
                do {
                    let plants = try Plant.getPlants(from: data)
                    completionHandler(.success(plants))
                }
                catch {
                    completionHandler(.failure(.couldNotParseJSON(rawError: error)))
                }
            }
        }
    }
    
    func postPlant(plant: Plant, completionHandler: @escaping (Result<Data,AppError>) -> () ) {
                let plant = plant
                guard let encodedPlant = try? JSONEncoder().encode(plant) else {fatalError()}
                NetworkManager.manager.performDataTask(url: airTablePlantURL, httpMethod: .post, data: encodedPlant) { (result) in
                    switch result {
                    case .success(let data):
                        completionHandler(.success(data))
                    case .failure(let error):
                        completionHandler(.failure(error))
                    }
                }
            }
    
    private var airTablePlantURL: URL {
        //TODO: Fix URL
        
         guard let url = URL(string: "https://api.airtable.com/v0/\(SecretKeys.APIPath)/Table%201?api_key=\(SecretKeys.APIKey)") else {fatalError("Error: Invalid URL")}

                return url
            }
    
            private init() {}
}
