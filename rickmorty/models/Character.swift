//
//  Character.swift
//  rickmorty
//
//  Created by Usuario on 14/08/2019.
//  Copyright © 2019 Antonio. All rights reserved.
//

import Foundation

struct Character: Codable, Equatable {
    var id: Int
    var name: String
    var especies: String
    var gender: String
    var status: String
    var origin: [String: String]
    var location: [String: String]
    var image: String
    var episodes: [String]
    var url: String
    var created: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case especies = "species"
        case gender
        case status
        case origin
        case location
        case image
        case episodes = "episode"
        case url
        case created
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        especies = try container.decode(String.self, forKey: .especies)
        gender = try container.decode(String.self, forKey: .gender)
        status = try container.decode(String.self, forKey: .status)
        origin = try container.decode([String: String].self, forKey: .origin)
        location = try container.decode([String: String].self, forKey: .location)
        image = try container.decode(String.self, forKey: .image)
        episodes = try container.decode([String].self, forKey: .episodes)
        url = try container.decode(String.self, forKey: .url)
        created = try container.decode(String.self, forKey: .created)
    }
}
