//
//  ViewController.swift
//  1788WinMillionGame
//
//  Created by Nikolai Krusser on 26.02.2022.
//

import UIKit

final class GameViewController: UIViewController, GameMainViewActionsDelegate {

    var buttonPressed = false
    var mainView: GameMainView { return self.view as! GameMainView }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.actionsDelegate = self
    }

//    Рутовая вью
    override func loadView() {
        self.view = GameMainView(frame: UIScreen.main.bounds)
    }
    
    func addButtonAction() {
        self.buttonPressed = !buttonPressed
        if self.buttonPressed {
            
            UIView.animate(withDuration: 0.5) {
                self.mainView.firstButton.setTitle("ответ №1", for: .normal)
                self.mainView.firstButton.backgroundColor = .systemRed
            }
        } else {
            UIView.animate(withDuration: 0.5) {
                self.mainView.firstButton.setTitle("", for: .normal)
                self.mainView.firstButton.backgroundColor = .black
            }
        }
    }
}

