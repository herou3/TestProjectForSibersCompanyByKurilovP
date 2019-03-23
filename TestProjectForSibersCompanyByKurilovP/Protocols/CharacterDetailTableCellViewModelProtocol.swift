//
//  CharacterDetailTableCellViewModelProtocol.swift
//  TestProjectForSibersCompanyByKurilovP
//
//  Created by Pavel Kurilov on 23.03.2019.
//  Copyright © 2019 Pavel Kurilov. All rights reserved.
//

import Foundation

protocol  CharacterDetailTableCellViewModelProtocol {
    
    // MARK: - Protocols properties
    var value: String? { get set}
    
    // MARK: - Protocols methods
    func configure(with value: String?)
}
