//
//  Character.swift
//  TestProjectForSibersCompanyByKurilovP
//
//  Created by Pavel Kurilov on 23.03.2019.
//  Copyright © 2019 Pavel Kurilov. All rights reserved.
//

import Foundation

struct Character: Codable {
    
    // MARK: - Properties
    let id: Int?
    let name: String?
    let status: String?
    let species: String?
    let type: String?
    let gender: String?
    let origin: Origin?
    let location: Location?
    let image: String?
    let episodes: [String]?
    let url: String?
    let created: String?
    
    // MARK: - Coding keys
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case status
        case species
        case type
        case gender
        case origin
        case location
        case image
        case episodes = "episode"
        case url
        case created
    }
    
    // MARK: - Init
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        species = try values.decodeIfPresent(String.self, forKey: .species)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        gender = try values.decodeIfPresent(String.self, forKey: .gender)
        origin = try values.decodeIfPresent(Origin.self, forKey: .origin)
        location = try values.decodeIfPresent(Location.self, forKey: .location)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        episodes = try values.decodeIfPresent([String].self, forKey: .episodes)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        created = try values.decodeIfPresent(String.self, forKey: .created)
    }
}
