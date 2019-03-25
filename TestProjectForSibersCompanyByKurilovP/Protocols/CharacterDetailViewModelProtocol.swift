//
//  CharacterDetailViewModelProtocol.swift
//  TestProjectForSibersCompanyByKurilovP
//
//  Created by Pavel Kurilov on 23.03.2019.
//  Copyright © 2019 Pavel Kurilov. All rights reserved.
//

import Foundation

protocol CharacterDetailViewModelProtocol {
    
    // MARK: - Protocols properties
    var id: Int? { get }
    var name: String? { get }
    var status: String? { get }
    var species: String? { get }
    var type: String? { get }
    var gender: String? { get }
    var originLocation: String? { get }
    var curentLocation: String? { get }
    var image: CachedImageView? { get }
    var numberOfRows: Int? { get }
    
    // MARK: - Protocols methods
    func detailTableCellViewModel(forIndexPath indexPath: IndexPath) -> CharacterDetailTableCellViewModelProtocol?
    func loadInformationCharacter(use id: Int) -> Void
    
}
