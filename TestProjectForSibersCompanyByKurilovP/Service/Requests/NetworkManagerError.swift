//
//  NetworkManagerError.swift
//  TestProjectForSibersCompanyByKurilovP
//
//  Created by Pavel Kurilov on 24.03.2019.
//  Copyright © 2019 Pavel Kurilov. All rights reserved.
//

import Foundation

enum NetworkManagerError: Error {
    case requestFailed
    case jsonConversionFailure
    case invalidData
    case responseUnsuccessful
    case jsonParsingFailure
    case responseUnsuccessfulCode404
    case responseUnsuccessfulCode401
    
    var localizedDescription: String {
        switch self {
        case .requestFailed: return "Request Failed"
        case .invalidData: return "Invalid Data"
        case .responseUnsuccessful: return "Response Unsuccessful"
        case .jsonParsingFailure: return "JSON Parsing Failure"
        case .jsonConversionFailure: return "JSON Conversion Failure"
        case .responseUnsuccessfulCode404: return "Character not found"
        case .responseUnsuccessfulCode401:
            return "Invalid API key. Please see https://rickandmortyapi.com/ for more info"
        }
    }
}
