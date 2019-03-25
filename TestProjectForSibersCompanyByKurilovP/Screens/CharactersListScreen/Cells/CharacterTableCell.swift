//
//  CharacterTableCell.swift
//  TestProjectForSibersCompanyByKurilovP
//
//  Created by Pavel Kurilov on 24.03.2019.
//  Copyright © 2019 Pavel Kurilov. All rights reserved.
//

import UIKit

class CharacterTableCell: DefaultCell {
    
    // MARK: - Init table cell
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Init(coder!) has not been implemented")
    }
    
    // MARK: - Create UIElements for cell
    private var characterImageView: CachedImageView = {
        let imageView = CachedImageView()
        imageView.image = UIImage(named: "unknown-icon")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "default string"
        nameLabel.textColor = .black
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.systemFont(ofSize: 18)
        nameLabel.numberOfLines = 2
        return nameLabel
    }()
    
    private var statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.text = "Dead"
        statusLabel.textColor = .gray
        statusLabel.font = UIFont.systemFont(ofSize: 12)
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        return statusLabel
    }()
    
    private var speciesLabel: UILabel = {
        let speciesLabel = UILabel()
        speciesLabel.text = "Humanoid"
        speciesLabel.textColor = .gray
        speciesLabel.font = UIFont.systemFont(ofSize: 12)
        speciesLabel.translatesAutoresizingMaskIntoConstraints = false
        return speciesLabel
    }()
    
    private var genderLabel: UILabel = {
        let genderLabel = UILabel()
        genderLabel.text = "Male"
        genderLabel.textColor = .gray
        genderLabel.font = UIFont.systemFont(ofSize: 12)
        genderLabel.translatesAutoresizingMaskIntoConstraints = false
        return genderLabel
    }()
    
    // MARK: - Configure CharacterTableCell
    private func addCharacterImageView() {
        addSubview(characterImageView)
        characterImageView.leftAnchor.constraint(equalTo: self.leftAnchor,
                                                 constant: Constant.marginLeftAndRightValue / 2).isActive = true
        characterImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor,
                                                   constant: -Constant.marginLeftAndRightValue / 2).isActive = true
        characterImageView.topAnchor.constraint(equalTo: self.topAnchor,
                                                constant: Constant.marginLeftAndRightValue / 2).isActive = true
        characterImageView.widthAnchor.constraint(equalToConstant: Constant.imageSizeValue).isActive = true
        characterImageView.heightAnchor.constraint(equalToConstant: Constant.imageSizeValue).isActive = true
    }
    
    private func addNameLabel() {
        addSubview(nameLabel)
        nameLabel.leftAnchor.constraint(equalTo: self.characterImageView.rightAnchor,
                                         constant: Constant.marginLeftAndRightValue / 2).isActive = true
        nameLabel.topAnchor.constraint(equalTo: self.characterImageView.topAnchor).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: self.rightAnchor,
                                         constant: -Constant.marginLeftAndRightValue / 2).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: Constant.labelSizeValue / 5).isActive = true
    }
    
    private func addStatusLabel() {
        addSubview(statusLabel)
        statusLabel.leftAnchor.constraint(equalTo: self.characterImageView.rightAnchor,
                                          constant: Constant.marginLeftAndRightValue / 2).isActive = true
        statusLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor,
                                         constant: Constant.marginLeftAndRightValue / 2).isActive = true
        statusLabel.heightAnchor.constraint(equalToConstant: Constant.labelSizeValue / 6).isActive = true
        statusLabel.widthAnchor.constraint(equalToConstant: Constant.imageSizeValue).isActive = true
    }
    
    private func addSpeciesLabel() {
        addSubview(speciesLabel)
        speciesLabel.leftAnchor.constraint(equalTo: self.statusLabel.rightAnchor,
                                          constant: Constant.marginLeftAndRightValue / 2).isActive = true
        speciesLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor,
                                         constant: Constant.marginLeftAndRightValue / 2).isActive = true
        speciesLabel.rightAnchor.constraint(equalTo: self.rightAnchor,
                                            constant: -Constant.marginLeftAndRightValue / 2).isActive = true
        speciesLabel.heightAnchor.constraint(equalToConstant: Constant.labelSizeValue / 6).isActive = true
    }
    
    private func addGenderLabel() {
        addSubview(genderLabel)
        genderLabel.leftAnchor.constraint(equalTo: self.characterImageView.rightAnchor,
                                          constant: Constant.marginLeftAndRightValue / 2).isActive = true
        genderLabel.topAnchor.constraint(equalTo: self.statusLabel.bottomAnchor,
                                         constant: Constant.marginLeftAndRightValue / 2).isActive = true
        genderLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor,
                                            constant: -Constant.marginLeftAndRightValue / 2).isActive = true
        genderLabel.rightAnchor.constraint(equalTo: self.rightAnchor,
                                           constant: -Constant.marginLeftAndRightValue / 2).isActive = true
    }
    
    override func setupViews() {
        addCharacterImageView()
        addNameLabel()
        addStatusLabel()
        addSpeciesLabel()
        addGenderLabel()
    }
    
    func configureData(viewModel: CharactersListTableCellViewModelProtocol) {
        characterImageView.loadImage(urlString: viewModel.image)
        nameLabel.text = viewModel.name
        statusLabel.text = viewModel.status
        speciesLabel.text = viewModel.species
        genderLabel.text = viewModel.gender
    }
}
