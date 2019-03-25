//
//  RequestFeeds.swift
//  TestProjectForSibersCompanyByKurilovP
//
//  Created by Pavel Kurilov on 23.03.2019.
//  Copyright © 2019 Pavel Kurilov. All rights reserved.
//

import Foundation

enum RequestFeeds {
    case character
    case characterId
}

extension RequestFeeds: NetworkEndpoint {
    
    // MARK: - Properties
    var base: String {
        return Constant.baseUrl
    }
    
    var path: String {
        switch self {
        case .character: return "/api/character/"
        case .characterId: return ""
        }
    }

}
