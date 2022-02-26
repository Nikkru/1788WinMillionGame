//
//  GameMainView.swift
//  1788WinMillionGame
//
//  Created by Nikolai Krusser on 26.02.2022.
//

import UIKit

final class GameMainView: UIView {
    
    var questionLabel: UILabel = {
        let label = UILabel()
        label.text                      = "Список вопросов"
        label.font                      = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment             = .center
        label.numberOfLines             = 0
        label.adjustsFontSizeToFitWidth = true
        label.textColor                 = .white
        label.backgroundColor           = .systemRed
        return label
    }()
    
//    MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .black
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
    
        addSubview(questionLabel)
    }
    
    private func setupConstraints() {
        setQuestionLabelConstraints()
    }
    
    private func configqustionLabel() {
 
    }
    
    private func setQuestionLabelConstraints() {
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 80),
            questionLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 40),
            questionLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -40)
        ])
    }
}
