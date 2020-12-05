//
//  SkillTableViewCell.swift
//  DeepSheet
//
//  Created by Rodrigo Silva Ribeiro on 24/11/20.
//

import UIKit

class SkillTableViewCell: UITableViewCell {
	
    lazy var diceImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "d10-green")
        self.diceView.addSubview(imageView)
        return imageView
    }()
	
    lazy var skillName: UILabel = {
       let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = .josefinSansSkillTitle()
        lbl.textColor = .backgroundBlack
        self.addSubview(lbl)
        return lbl
    }()
	
    lazy var skillDesc: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = .josefinSansSkillDesc()
        lbl.textColor = .backgroundBlack
        self.addSubview(lbl)
        return lbl
    }()
	
    lazy var skillValue: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = .josefinSansBold()
        self.diceView.addSubview(lbl)
        return lbl
    }()
	
    lazy var skillValueBy2: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = .josefinSansBold()
        self.addSubview(lbl)
        return lbl
    }()
	
    lazy var skillValueBy5: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = .josefinSansBold()
        self.addSubview(lbl)
        return lbl
    }()
	
    lazy var colorView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightSeaGreen
        self.addSubview(view)
        return view
    }()
	
    lazy var squareViewBy2: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .darkSeaGreen
        self.addSubview(view)
        return view
    }()
	
    lazy var squareViewBy5: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .darkSeaGreen
        self.addSubview(view)
        return view
    }()
	
    lazy var diceView: UIButton = {
        let view = UIButton()
        view.addTarget(self, action: #selector(buttonTest), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        self.addSubview(view)
        return view
    }()
	
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(skill: Skill) {
        skillName.text = skill.name
        skillDesc.text = skill.desc
        skillValue.text = skill.value.description
        skillValueBy2.text = (skill.value/2).description
        skillValueBy5.text = (skill.value/5).description
        if !skill.isActivated {
            colorView.backgroundColor = .lightGray
        } else {
            colorView.backgroundColor = .lightSeaGreen
        }
    }
    
    @objc func buttonTest() {
        print("eu presto")
    }
    
    func setConstraints() {
        
        colorView.topAnchor.constraint(equalTo: self.topAnchor, constant: 7).isActive = true
        colorView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -7).isActive = true
        colorView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 14).isActive = true
        colorView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -14).isActive = true
        
        squareViewBy5.centerYAnchor.constraint(equalTo: colorView.centerYAnchor).isActive = true
        squareViewBy5.trailingAnchor.constraint(equalTo: colorView.trailingAnchor, constant: -3).isActive = true
        squareViewBy5.heightAnchor.constraint(equalToConstant: 40).isActive = true
        squareViewBy5.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        squareViewBy2.centerYAnchor.constraint(equalTo: colorView.centerYAnchor).isActive = true
        squareViewBy2.trailingAnchor.constraint(equalTo: squareViewBy5.leadingAnchor, constant: -3).isActive = true
        squareViewBy2.heightAnchor.constraint(equalToConstant: 40).isActive = true
        squareViewBy2.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        diceView.centerYAnchor.constraint(equalTo: colorView.centerYAnchor).isActive = true
        diceView.trailingAnchor.constraint(equalTo: squareViewBy2.leadingAnchor, constant: -3).isActive = true
        diceView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        diceView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        diceImage.centerYAnchor.constraint(equalTo: diceView.centerYAnchor).isActive = true
        diceImage.centerXAnchor.constraint(equalTo: diceView.centerXAnchor).isActive = true
        diceImage.widthAnchor.constraint(equalTo: diceView.widthAnchor, multiplier: 0.9).isActive = true
        diceImage.heightAnchor.constraint(equalTo: diceView.heightAnchor, multiplier: 0.9).isActive = true
        
        skillName.centerYAnchor.constraint(equalTo: colorView.centerYAnchor).isActive = true
        skillName.leadingAnchor.constraint(equalTo: colorView.leadingAnchor, constant: 12).isActive = true

        skillDesc.topAnchor.constraint(equalTo: skillName.bottomAnchor).isActive = true
        skillDesc.leadingAnchor.constraint(equalTo: colorView.leadingAnchor, constant: 12).isActive = true
        
        skillValue.centerYAnchor.constraint(equalTo: diceView.centerYAnchor).isActive = true
        skillValue.centerXAnchor.constraint(equalTo: diceView.centerXAnchor, constant: 0).isActive = true
        
        skillValueBy2.centerYAnchor.constraint(equalTo: squareViewBy2.centerYAnchor).isActive = true
        skillValueBy2.centerXAnchor.constraint(equalTo: squareViewBy2.centerXAnchor).isActive = true
        
        skillValueBy5.centerYAnchor.constraint(equalTo: squareViewBy5.centerYAnchor).isActive = true
        skillValueBy5.centerXAnchor.constraint(equalTo: squareViewBy5.centerXAnchor).isActive = true
    }
}
