//
//  ViewController.swift
//  1788WinMillionGame
//
//  Created by Nikolai Krusser on 26.02.2022.
//

import UIKit

final class GameViewController: UIViewController, GameMainViewActionsDelegate {
    
    private let game = Game()
    private var answer: String = ""
    private var didQuestion: [String] = []
    private var arrayOfAnswer: [String] = []
    private var score: Int = 0
    
    var mainView: GameMainView { return self.view as! GameMainView }
    
    var pressedButton = false
    
// MARK: - LifeCyrcle
    override func viewDidLoad() {
        super.viewDidLoad()
      
        mainView.actionsDelegate = self
        
        mainView.onAddButtonAction = { [weak self] in
            self?.addButtonFirstAction()
            
        }
    }

//    Рутовая вью
    override func loadView() {
        
        self.view = GameMainView(frame: UIScreen.main.bounds)
    }

//    MARK: - GameMainViewActionsDelegate
    func addButtonFirstAction() {
        
        pressedButton = !pressedButton
        if pressedButton {
            
            UIView.animate(withDuration: 0.5) {
                
                self.score += self.game.gameArray100[0]["win"] as! Int
                self.arrayOfAnswer = self.game.gameArray100[0]["answer"] as! [String]
                self.answer = self.arrayOfAnswer[0] 
                self.mainView.firstButton.setTitle(self.game.gameArray100[0]["question"] as? String, for: .normal)
                self.mainView.firstButton.backgroundColor = .red
                self.mainView.secondButton.setTitle(self.arrayOfAnswer[0], for: .normal)
                self.mainView.thirdButton.setTitle(self.arrayOfAnswer[1], for: .normal)
                self.mainView.forthButton.setTitle(self.arrayOfAnswer[2], for: .normal)
            }
        } else {
            self.mainView.firstButton.setTitle("1", for: .normal)
            self.mainView.firstButton.backgroundColor = .darkGray
        }
    }
}

