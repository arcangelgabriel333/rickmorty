//
//  LocalionsController.swift
//  rickmorty
//
//  Created by Usuario on 14/08/2019.
//  Copyright © 2019 Antonio. All rights reserved.
//

import Foundation

class LocationsController {
    func fetchMultipleLocations(queries: [String: String]? = nil, completion: @escaping ([Location]?) -> Void) {
        var baseURL = URL(string: "https://rickandmortyapi.com/api/location/")!
        
        if let queries = queries {
            baseURL = baseURL.withQueries(queries)!
        }
        let jsonDecoder = JSONDecoder()
        
        let task = URLSession.shared.dataTask(with: baseURL) { (data, response, error) in
            if let data = data, let location = try? jsonDecoder.decode(PagedInfo<Location>.self, from: data) {
                
                //print("\(character.results)")
                completion(location.results)
            }
            else {
                print("Could not decode")
                completion(nil)
            }
        }
        task.resume()
    }
}
