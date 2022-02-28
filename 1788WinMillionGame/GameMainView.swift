//
//  GameMainView.swift
//  1788WinMillionGame
//
//  Created by Nikolai Krusser on 26.02.2022.
//

import UIKit

protocol GameMainViewActionsDelegate: AnyObject {
    func addButtonFirstAction()

}

final class GameMainView: UIView {
    
//    Delegate
    weak var actionsDelegate: GameMainViewActionsDelegate?
    
//    Clogure
    var onAddButtonAction: (() -> Void)?
    
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
    
    var firstButton: ActionButton = {
       let button = ActionButton()
        button.setTitle("100", for: .normal)
        return button
    }()
    
    var secondButton: ActionButton = {
       let button = ActionButton()
        button.setTitle("1000", for: .normal)
        return button
    }()
    
    var thirdButton: ActionButton = {
       let button = ActionButton()
        button.setTitle("10000", for: .normal)
        return button
    }()
    
    var forthButton: ActionButton = {
       let button = ActionButton()
        button.setTitle("100000", for: .normal)
        return button
    }()
    
    
    var scoreLabel: UILabel = {
       let label = UILabel()
        label.text = "Вы выйграли 0 рублей"
        label.font                      = UIFont.systemFont(ofSize: 20)
        label.textAlignment             = .center
        label.numberOfLines             = 0
        label.adjustsFontSizeToFitWidth = true
        label.textColor                 = .white
        label.backgroundColor           = .link
        label.layer.cornerRadius = 8
        label.clipsToBounds = true
        return label
    }()
    
    var questionLabel: UILabel = {
        let label = UILabel()
        label.text                      = "Список вопросов"
        label.font                      = UIFont.systemFont(ofSize: 30)
        label.textAlignment             = .center
        label.numberOfLines             = 0
        label.adjustsFontSizeToFitWidth = true
        label.textColor                 = .white
        label.backgroundColor           = .gray
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        return label
    }()
    
    var stackView: UIStackView = {
    
        let stackView          = UIStackView()
        stackView.axis         = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing      = 10
        return stackView
    }()

    private func setupViews() {
    
        addSubview(firstButton)
        addSubview(secondButton)
        addSubview(thirdButton)
        addSubview(forthButton)
        addSubview(questionLabel)
        addSubview(stackView)
        addSubview(scoreLabel)
        addButtonToCtackView()
    }
    
    private func setupConstraints() {
        
        setQuestionLabelConstraints()
        setStackViewConstraints()
        setScoreLabelConstraints()
    }
    
    private func addButtonToCtackView() {
//        let numberOfButtons = 5
//        for i in 1...numberOfButtons {
//            let button = ActionButton()
//            button.setTitle("\(i)", for: .normal)
//            stackView.addArrangedSubview(button)
//        }
        stackView.addArrangedSubview(firstButton)
        stackView.addArrangedSubview(secondButton)
        stackView.addArrangedSubview(thirdButton)
        stackView.addArrangedSubview(forthButton)
    }
    
    private func setQuestionLabelConstraints() {
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 40),
            questionLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 40),
            questionLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -40),
        ])
    }
    
    private func setStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.questionLabel.bottomAnchor, constant: 30),
            stackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 40),
            stackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -40),
            stackView.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor, constant: -40)
        ])
    }
    
    private func setScoreLabelConstraints() {
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 20),
            scoreLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 50),
            scoreLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -50),
        ])
    }
    
//    MARK: - Actions
     func addActions() {
        firstButton.addTarget(self, action: #selector(self.addActionsButtonPressed), for: .touchUpInside)
    }
    
    @objc func addActionsButtonPressed() {
        
        onAddButtonAction?()
        
//        actionsDelegate?.addButtonAction()
    }
}

