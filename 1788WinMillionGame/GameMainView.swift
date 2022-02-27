//
//  GameMainView.swift
//  1788WinMillionGame
//
//  Created by Nikolai Krusser on 26.02.2022.
//

import UIKit

protocol GameMainViewActionsDelegate: AnyObject {
    func addButtonAction()
}

final class GameMainView: UIView {
    
    weak var actionsDelegate: GameMainViewActionsDelegate?
    
    //    MARK: - LifeCycle
        override init(frame: CGRect) {
            super.init(frame: frame)
            self.backgroundColor = .black
            setupViews()
            setupConstraints()
            addActions()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    var questionLabel: UILabel = {
        let label = UILabel()
        label.text                      = "Список вопросов"
        label.font                      = UIFont.systemFont(ofSize: 30)
        label.textAlignment             = .center
        label.numberOfLines             = 0
        label.adjustsFontSizeToFitWidth = true
        label.textColor                 = .white
        label.backgroundColor           = .systemGray
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        return label
    }()
    
    var scoreLabel: UILabel = {
        let label = UILabel()
        label.text                      = "Вы выиграли 0 рублей"
        label.font                      = UIFont.systemFont(ofSize: 28)
        label.textAlignment             = .center
        label.numberOfLines             = 0
        label.adjustsFontSizeToFitWidth = true
        label.textColor                 = .white
        label.backgroundColor           = .systemGray2
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        return label
    }()
    
    var firstButton: ActionButton = {
        let button = ActionButton()
        button.setTitle("Вопрос на миллион", for: .normal)
        return button
    }()
    

    
    private func setupViews() {
    
        addSubview(questionLabel)
        addSubview(scoreLabel)
        addSubview(firstButton)
    }
    
    private func setupConstraints() {
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        setQuestionLabelConstraints()
        setScoreLabelConstraints()
        setFirstButtonConstraints()
    }
    
    private func setScoreLabelConstraints() {
        
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 40),
            scoreLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 40),
            scoreLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -40)
        ])
    }
    
    private func setQuestionLabelConstraints() {
        
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 20),
            questionLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 40),
            questionLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -40)
        ])
    }
    
    private func setFirstButtonConstraints() {
        
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            firstButton.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 20),
            firstButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 40),
            firstButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -40)
        ])
    }

//    MARK: - ACTIONS
    private func addActions() {
        firstButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }

    
    @objc private func buttonPressed() {
        
//        DELEGATE
        actionsDelegate?.addButtonAction()
    }
}
