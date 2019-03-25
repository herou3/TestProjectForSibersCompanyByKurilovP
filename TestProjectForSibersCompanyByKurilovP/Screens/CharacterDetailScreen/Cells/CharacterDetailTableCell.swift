//
//  CharacterDetailTableCell.swift
//  TestProjectForSibersCompanyByKurilovP
//
//  Created by Pavel Kurilov on 25.03.2019.
//  Copyright © 2019 Pavel Kurilov. All rights reserved.
//

import UIKit

class CharacterDetailTableCell: DefaultCell {
    
    // MARK: - Properties
    private var cellType: DefaultCellType?
    
    // MARK: - Init table cell
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Init(coder!) has not been implemented")
    }
    
    // MARK: - Create UIElements for cell
    private var decriptionLabel: UILabel = {
        let decriptionLabel = UILabel()
        decriptionLabel.textColor = .black
        decriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        decriptionLabel.font = UIFont.systemFont(ofSize: 18)
        decriptionLabel.numberOfLines = 1
        return decriptionLabel
    }()
    
    var valueLabel: UILabel = {
        let valueLabel = UILabel()
        valueLabel.textColor = .darkGray
        valueLabel.font = UIFont.systemFont(ofSize: 18)
        valueLabel.tintColor = .black
        valueLabel.numberOfLines = 2
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        return valueLabel
    }()
    
    private let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Configure character detail cell
    private func addDecriptionLabel() {
        addSubview(decriptionLabel)
        decriptionLabel.leftAnchor.constraint(equalTo: self.leftAnchor,
                                                 constant: Constant.marginLeftAndRightValue / 2).isActive = true
        decriptionLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor,
                                                   constant: -Constant.marginLeftAndRightValue / 2).isActive = true
        decriptionLabel.topAnchor.constraint(equalTo: self.topAnchor,
                                                constant: Constant.marginLeftAndRightValue / 2).isActive = true
        decriptionLabel.rightAnchor.constraint(equalTo: self.centerXAnchor,
                                               constant: -Constant.marginLeftAndRightValue / 2).isActive = true
        decriptionLabel.heightAnchor.constraint(equalToConstant: Constant.fontSizeValue).isActive = true
    }
    
    private func addValueLabel() {
        addSubview(valueLabel)
        valueLabel.leftAnchor.constraint(equalTo: self.centerXAnchor,
                                              constant: Constant.marginLeftAndRightValue / 2).isActive = true
        valueLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor,
                                                constant: -Constant.marginLeftAndRightValue / 2).isActive = true
        valueLabel.topAnchor.constraint(equalTo: self.topAnchor,
                                             constant: Constant.marginLeftAndRightValue / 2).isActive = true
        valueLabel.rightAnchor.constraint(equalTo: self.rightAnchor,
                                          constant: -Constant.marginLeftAndRightValue / 2).isActive = true
        valueLabel.heightAnchor.constraint(equalToConstant: Constant.fontSizeValue).isActive = true
    }
    
    private func addLineView() {
        addSubview(lineView)
        lineView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        lineView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        lineView.topAnchor.constraint(equalTo: self.bottomAnchor,
                                        constant: -Constant.marginLeftAndRightValue / 16 ).isActive = true
        lineView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: Constant.marginLeftAndRightValue / 8).isActive = true
    }
    
    override func setupViews() {
        addDecriptionLabel()
        addValueLabel()
        addLineView()
        self.backgroundColor = UIColor.aliceBlue
    }
    
    func configure(with viewModel: CharacterDetailTableCellViewModelProtocol) {
        guard let characterDetailInfoCellViewModel = viewModel as? CharacterDetailCellViewModel else { return }
        self.cellType = characterDetailInfoCellViewModel.cellType
        decriptionLabel.text = cellType?.description
        valueLabel.text = characterDetailInfoCellViewModel.value
    }
}
