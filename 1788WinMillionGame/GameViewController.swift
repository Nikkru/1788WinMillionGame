//
//  ViewController.swift
//  1788WinMillionGame
//
//  Created by Nikolai Krusser on 26.02.2022.
//

import UIKit

final class GameViewController: UIViewController {

    var mainView: GameMainView { return self.view as! GameMainView }
    var pressedButton = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }

//    Рутовая вью
    override func loadView() {
        self.view = GameMainView(frame: UIScreen.main.bounds)
    }

}

