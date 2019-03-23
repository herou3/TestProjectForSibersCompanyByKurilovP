//
//  ErrorResponse.swift
//  TestProjectForSibersCompanyByKurilovP
//
//  Created by Pavel Kurilov on 23.03.2019.
//  Copyright © 2019 Pavel Kurilov. All rights reserved.
//

import Foundation

struct ErrorResponse: Codable {
    
    // MARK: - Properties
    let error: String?
    
    // MARK: - Coding keys
    enum CodingKeys: String, CodingKey {
        case error
    }
    
    // MARK: - Init
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        error = try values.decodeIfPresent(String.self, forKey: .error)
    }
}
