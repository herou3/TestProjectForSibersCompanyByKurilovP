//
//  СharacterDetailController.swift
//  TestProjectForSibersCompanyByKurilovP
//
//  Created by Pavel Kurilov on 25.03.2019.
//  Copyright © 2019 Pavel Kurilov. All rights reserved.
//

import UIKit

class СharacterDetailController: UIViewController {
    
    // MARK: - Properties
    private var characterDetailViewModel: CharacterDetailViewModel?
    private let characterDetailCellReuseIdentifier = "cellDetailId"
    private let dataTableView: UITableView = UITableView()
    
    // MARK: - Init / deinit
    init(viewModel: CharacterDetailViewModel) {
        self.characterDetailViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        configureCarDetailController()
        viewModel.loadInformationCharacter(use: viewModel.id ?? 0)
        self.characterDetailViewModel?.callAlertBlock = { [unowned self] titleValue, messageValue in
            Alert.showBasicAlert(on: self, with: titleValue, message: messageValue)
        }
        self.characterDetailViewModel?.requestUpdatedBlock = { [unowned self] in
            self.dataTableView.reloadData()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Rules
    override func viewDidLoad() {
        super.viewDidLoad()
       // configureCarDetailController()
    }
    
    // MARK: - Configure character detail controller
    private func configureTablleView() {
        self.view.addSubview(dataTableView)
        dataTableView.translatesAutoresizingMaskIntoConstraints = false
        dataTableView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        dataTableView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        dataTableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        dataTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        dataTableView.backgroundColor = UIColor.white
        dataTableView.register(CharacterDetailTableCell.self,
                           forCellReuseIdentifier: characterDetailCellReuseIdentifier)
        dataTableView.showsHorizontalScrollIndicator = false
        dataTableView.dataSource = self
        dataTableView.delegate = self
        dataTableView.tableFooterView = UIView()
    }

    private func configureCarDetailController() {
        configureTablleView()
    }
    
    // MARK: - Get cell
    func getDetailInfoCell(with viewModel: CharacterDetailTableCellViewModelProtocol,
                           and indexPath: IndexPath,
                           in tableView: UITableView) -> UITableViewCell {
        guard let detailInfoCellViewModel = viewModel as? CharacterDetailCellViewModel else {
            return UITableViewCell()
        }
        guard let detailInfoCell = tableView.dequeueReusableCell(withIdentifier: characterDetailCellReuseIdentifier, for: indexPath)
            as? CharacterDetailTableCell else { return UITableViewCell(style: .default, reuseIdentifier: characterDetailCellReuseIdentifier) }
        detailInfoCell.configure(with: detailInfoCellViewModel)
        return detailInfoCell
    }
}

// MARK: - Extension table data source
extension СharacterDetailController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.characterDetailViewModel?.numberOfRows ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 60
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let detailCellViewModel = characterDetailViewModel?.detailTableCellViewModel(forIndexPath: indexPath) ??
            CharacterDetailCellViewModel(value: characterDetailViewModel?.name, cellType: .nameCharacter)
        
            return self.getDetailInfoCell(with: detailCellViewModel, and: indexPath, in: dataTableView)
    }
}
