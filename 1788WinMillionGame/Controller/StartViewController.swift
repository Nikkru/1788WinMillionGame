//
//  StartViewController.swift
//  1788WinMillionGame
//
//  Created by Nikolai Krusser on 13.03.2022.
//

import UIKit

class StartViewController: UIViewController {

    var mainView: StartMainView { return self.view as! StartMainView }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func loadView() {
        self.view = StartMainView(frame: UIScreen.main.bounds)
    }
}
