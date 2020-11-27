//
//  AdditionCardView.swift
//  DeepSheet
//
//  Created by Gustavo Lemos on 26/11/20.
//

import UIKit

class AdditionCardView: UIView {

    // MARK: - Components

    lazy var additionCardLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(label)
        label.font = UIFont.josefinSansBold17()
        label.textAlignment = .center
        label.textColor = .ivory
        label.backgroundColor = .clear
       
        return label
    }()
//    lazy var additionCardPlusSign: UIImage {
//
//    }
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        configureLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func draw(_ rect: CGRect) {
        self.layer.borderWidth = 3
        self.layer.cornerRadius = 5
        self.layer.borderColor = UIColor.clear.cgColor
        self.backgroundColor = .red
        self.addDashedBorder()
    }
    private func configureLayout() {
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 44),
        
            additionCardLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            additionCardLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
        
        ])
    }
}
