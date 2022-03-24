//
//  MainStartView.swift
//  1788WinMillionGame
//
//  Created by Nikolai Krusser on 13.03.2022.
//

import UIKit

final class StartMainView: UIView {
    
    var onAddResultButtonAction: (() -> Void)?
    var onAddPlayButtonAction: (() -> Void)?

   override init(frame: CGRect) {
        super.init(frame: frame)
    
    self.backgroundColor = .black
    setupViews()
    configureStack()
    setStackViewConstraints()
    addActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var resultButton: ActionButton = {
        let button = ActionButton()
        button.setTitle("Show game results", for: .normal)
        return button
    }()
    
    var playButton: ActionButton = {
        let button = ActionButton()
        button.setTitle("Start Game", for: .normal)
        return button
    }()
    
    var resultLabel: UILabel = {
        let label = UILabel()
        label.font                      = UIFont.systemFont(ofSize: 12)
        label.textAlignment             = .left
        label.numberOfLines             = 0
        label.adjustsFontSizeToFitWidth = true
        label.textColor                 = .white
        label.backgroundColor           = .link
        label.layer.cornerRadius        = 8
        label.clipsToBounds             = true
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
        addSubview(stackView)
        addSubview(resultButton)
        addSubview(playButton)
        addSubview(resultLabel)
    }
    
    private func configureStack() {
        stackView.addArrangedSubview(resultButton)
        stackView.addArrangedSubview(playButton)
        stackView.addArrangedSubview(resultLabel)
    }
    
    private func setStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 20),
            stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 40),
            stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -40),
            stackView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor, constant: -40)
        ])
    }
    
    func addActions() {
        resultButton.addTarget(self, action: #selector(self.addActionResultButtonPressed), for: .touchUpInside)
        playButton.addTarget(self, action: #selector(self.addActionPlayButtonPressed), for: .touchUpInside)
    }
    
    @objc func addActionResultButtonPressed() {
        onAddResultButtonAction?()
    }
    
    @objc func addActionPlayButtonPressed() {
        onAddPlayButtonAction?()
    }

}
