//
//  ConfigButton.swift
//  DeepSheet
//
//  Created by Gustavo Lemos on 09/12/20.
//

import UIKit

class ConfigButton: UIButton {

    
    init() {
        super.init(frame: .zero)
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 22, weight: .ultraLight, scale: .medium)
        self.setImage(UIImage(systemName: "gearshape.fill", withConfiguration: imageConfig), for: .normal)
        self.tintColor = .ivory


    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
