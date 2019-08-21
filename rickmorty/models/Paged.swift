//
//  Paged.swift
//  rickmorty
//
//  Created by Usuario on 14/08/2019.
//  Copyright © 2019 Antonio. All rights reserved.
//

import Foundation

struct PagedInfo<T: Codable>: Codable {
    struct Meta: Codable {
        var count: Int
        var pages: Int
        var next: String
        var prev: String
    }
    
    private enum CodingKeys: String, CodingKey {
        case meta = "info"
        case results
    }
    
    let meta: Meta
    let results: [T]
}
