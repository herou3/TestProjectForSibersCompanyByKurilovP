//
//  CharactersListViewModelProtocol.swift
//  TestProjectForSibersCompanyByKurilovP
//
//  Created by Pavel Kurilov on 23.03.2019.
//  Copyright © 2019 Pavel Kurilov. All rights reserved.
//

import Foundation

protocol CharactersListViewModelProtocol {
    
    // MARK: - Protocols methods
    func numberOfRows(inSection section: Int) -> Int
    func numberOfSections() -> Int
    func cellViewModel(forIndexPath indexPath: IndexPath) -> CharactersListTableCellViewModelProtocol?
    func selectRow(atIndexPath indexPath: IndexPath)
    func titleForHeader(InSection section: Int) -> String
    func filterContentBySearchText(_ searchText: String)
}
