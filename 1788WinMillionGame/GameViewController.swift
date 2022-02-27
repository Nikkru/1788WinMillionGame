//
//  ViewController.swift
//  1788WinMillionGame
//
//  Created by Nikolai Krusser on 26.02.2022.
//

import UIKit

final class GameViewController: UIViewController, GameMainViewActionsDelegate {
  
    var mainView: GameMainView { return self.view as! GameMainView }
    
    var pressedButton = false
    
// MARK: - LifeCyrcle
    override func viewDidLoad() {
        super.viewDidLoad()
      
        mainView.actionsDelegate = self
        
        mainView.onAddButtonAction = { [weak self] in
            self?.addButtonAction()
            
        }
    }

//    Рутовая вью
    override func loadView() {
        
        self.view = GameMainView(frame: UIScreen.main.bounds)
    }

//    MARK: - GameMainViewActionsDelegate
    func addButtonAction() {
        
        pressedButton = !pressedButton
        if pressedButton {
            
            UIView.animate(withDuration: 0.5) {
                self.mainView.firstButton.setTitle("Ответ получен", for: .normal)
                self.mainView.firstButton.backgroundColor = .red
            }
        } else {
            self.mainView.firstButton.setTitle("1", for: .normal)
            self.mainView.firstButton.backgroundColor = .darkGray
        }
    }
}

