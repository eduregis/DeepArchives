//
//  IllustrationView.swift
//  DeepSheet
//
//  Created by Eduardo Oliveira on 24/11/20.
//

import UIKit

class IllustrationView: UIView {
    
    lazy var borderView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
        return view
    }()
    
    lazy var characterImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = false
        imageView.contentMode = .scaleAspectFit
        self.addSubview(imageView)
        return imageView
    }()
    
    init(image: UIImage) {
        super.init(frame: .zero)
        characterImage.image = image
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented, because will not be used on a storyboard")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //This will make the view rounded
        borderView.layer.borderWidth = 3
        borderView.layer.borderColor = UIColor.lightSeaGreen.cgColor
        borderView.layer.cornerRadius = 5
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            //Round View Constraints
            borderView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            borderView.widthAnchor.constraint(equalToConstant: 218),
            borderView.heightAnchor.constraint(equalToConstant: 218),
            borderView.topAnchor.constraint(equalTo: self.topAnchor, constant: 40),
            
            characterImage.centerYAnchor.constraint(equalTo: borderView.centerYAnchor),
            characterImage.centerXAnchor.constraint(equalTo: borderView.centerXAnchor),
            characterImage.widthAnchor.constraint(equalTo: borderView.widthAnchor),
            characterImage.heightAnchor.constraint(equalTo: borderView.heightAnchor)
        ])
    }
}
