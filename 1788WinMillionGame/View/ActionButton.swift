//
//  AnswerButton.swift
//  1788WinMillionGame
//
//  Created by Nikolai Krusser on 26.02.2022.
//

import UIKit

final class ActionButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   private func setupButton() {
        setTitleColor((.white), for: .normal)
        backgroundColor    = .darkGray
        titleLabel?.font   = UIFont(name: "answer to guestion / question", size: 100)
    layer.cornerRadius = 10
    }
}
