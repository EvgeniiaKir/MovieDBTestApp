//
//  UILabel.swift
//  MovieDBTestApp
//
//  Created by Евгения Колдышева on 13.03.2021.
//

import UIKit

extension UILabel {
    
    convenience init(text: String, font: UIFont? = .sfProDisplay(14), color: UIColor) {
        self.init()
        
        self.text = text
        self.font = font
        self.textColor = color
    }
}
