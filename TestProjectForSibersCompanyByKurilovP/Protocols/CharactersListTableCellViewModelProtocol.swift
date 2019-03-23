//
//  CharactersListTableCellViewModelProtocol.swift
//  TestProjectForSibersCompanyByKurilovP
//
//  Created by Pavel Kurilov on 23.03.2019.
//  Copyright © 2019 Pavel Kurilov. All rights reserved.
//

import UIKit

protocol CharactersListTableCellViewModelProtocol {
    
    // MARK: - Protocols properties
    var name: String { get }
    var status: String { get }
    var species: String { get }
    var gender: String { get }
    var image: UIImage { get }
}
