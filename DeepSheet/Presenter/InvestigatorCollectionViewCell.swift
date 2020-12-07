//
//  InvestigatorCollectionViewCell.swift
//  DeepSheet
//
//  Created by Eduardo Oliveira on 01/12/20.
//

import UIKit

class InvestigatorCollectionViewCell: UICollectionViewCell {
    
    lazy var investigatorName: UILabel = {
       let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = .josefinSansSkillTitle()
        lbl.text = "Cleiton"
        lbl.textColor = .ivory
        self.addSubview(lbl)
        return lbl
    }()
    
    lazy var investigatorOccupation: UILabel = {
       let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = .josefinSansSkillDesc()
        lbl.text = "DJ"
        lbl.textColor = .ivory
        self.addSubview(lbl)
        return lbl
    }()
    
    lazy var addInvestigator: UILabel = {
       let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = .josefinSansRegular()
        lbl.text = LocalizedStrings.addInvestigator
        lbl.lineBreakMode = .byWordWrapping
        lbl.numberOfLines = 2
        lbl.textAlignment = .center
        lbl.textColor = .ivory
        self.addSubview(lbl)
        return lbl
    }()
    
    lazy var investigatorImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = false
        imageView.contentMode = .scaleAspectFit
        self.addSubview(imageView)
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setConstraints()
    }
    
    override func draw(_ rect: CGRect) {
        self.layer.borderWidth = 3
        self.layer.cornerRadius = 5
        self.backgroundColor = .clear
    }
    
    func set(investigator: Investigator? = nil, name: String? = nil, occupation: String? = nil, image: UIImage? = nil, dashed: Bool) {
        investigatorName.text = (investigator != nil) ? investigator?.name! : name
        investigatorOccupation.text = (investigator != nil) ? investigator?.occupation! : occupation
        if let image = image {
            investigatorImage.image = image
        }
        if dashed {
            self.addDashedBorder(color: UIColor.goldenYellow.cgColor)
            investigatorName.isHidden = true
            investigatorOccupation.isHidden = true
            investigatorImage.isHidden = true
            addInvestigator.isHidden = false
        } else {
            self.layer.borderColor = UIColor.goldenYellow.cgColor
            investigatorName.isHidden = false
            investigatorOccupation.isHidden = false
            investigatorImage.isHidden = false
            addInvestigator.isHidden = true
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            addInvestigator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            addInvestigator.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            investigatorImage.widthAnchor.constraint(equalTo: self.widthAnchor),
            investigatorImage.heightAnchor.constraint(equalTo: self.heightAnchor),
            
            investigatorOccupation.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            investigatorOccupation.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            investigatorName.bottomAnchor.constraint(equalTo: investigatorOccupation.topAnchor, constant: -4),
            investigatorName.leadingAnchor.constraint(equalTo: investigatorOccupation.leadingAnchor)
        ])
    }
}
