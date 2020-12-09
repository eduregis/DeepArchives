//
//  ConfigTableViewCell.swift
//  DeepSheet
//
//  Created by Gustavo Lemos on 09/12/20.
//

import UIKit

class ConfigTableViewCell: UITableViewCell {

    var configCellLabel = UILabel()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(configCellLabel)
        self.backgroundColor = .clear
        configCellLabelSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configCellLabelSetup(){
        configCellLabel.numberOfLines = 1
        configCellLabel.adjustsFontSizeToFitWidth = true
        configCellLabel.font = UIFont.josefinSansBold17()
        configCellLabel.textAlignment = .center
        configCellLabel.translatesAutoresizingMaskIntoConstraints = false
        configCellLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        configCellLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
    }
}
