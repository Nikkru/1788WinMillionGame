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
        
        try? Game.instance.results = GameCaretaker<[GameSessionResult]>().retrieveRecords() ??
        [GameSessionResult]()
        mainView.resultLabel.text = getResults()
        
        mainView.onAddResultButtonAction = { [weak self] in
            self?.addResultButtonAction()
        }
        mainView.onAddPlayButtonAction = { [weak self] in
            self?.addPlayButtonAction()
        }
    }
    
    override func loadView() {
        self.view = StartMainView(frame: UIScreen.main.bounds)
    }
    
    private func getResults() -> String {
        return Game.instance.results.isEmpty ? "Game results is empty" :
            Game.instance.results.map { $0.description() }.reversed().joined(separator: "\n")
    }
    
    func addResultButtonAction() {
        mainView.resultLabel.text = getResults()
    }
    
    func addPlayButtonAction() {
        let rootVC = GameViewController()
        if Game.instance.session == nil {
            let session = GameSession()
            Game.instance.session = session
            rootVC.delegate = session
        }
        rootVC.modalPresentationStyle = .fullScreen
        present(rootVC, animated: true, completion: nil)
        
    }
}
