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
    
    lazy var additionCardPlusSign: UIImageView = {
        let plusImage = UIImageView()
        self.addSubview(plusImage)
        plusImage.translatesAutoresizingMaskIntoConstraints = false
        plusImage.clipsToBounds = false
        plusImage.contentMode = .scaleAspectFit
        plusImage.backgroundColor = .clear
        plusImage.tintColor = .ivory
        return plusImage
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 22, weight: .black, scale: .small)
        additionCardPlusSign.image = UIImage(systemName: "plus.circle.fill", withConfiguration: imageConfig)
        configureStackView()
        configureLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func draw(_ rect: CGRect) {
        self.layer.borderWidth = 3
        self.layer.cornerRadius = 5
        self.layer.borderColor = UIColor.clear.cgColor
        self.addDashedBorder()
    }
    
    var additionCardStack = UIStackView()
    
    func configureStackView() {
        self.addSubview(additionCardStack)
        additionCardStack.translatesAutoresizingMaskIntoConstraints = false
        additionCardStack.axis = .horizontal
        additionCardStack.spacing = 10
        additionCardStack.addArrangedSubview(additionCardLabel)
        additionCardStack.addArrangedSubview(additionCardPlusSign)
        additionCardLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        additionCardPlusSign.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    private func configureLayout() {
            self.heightAnchor.constraint(equalToConstant: 44).isActive = true
            additionCardStack.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
}
