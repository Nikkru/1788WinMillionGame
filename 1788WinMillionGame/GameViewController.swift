//
//  ViewController.swift
//  1788WinMillionGame
//
//  Created by Nikolai Krusser on 26.02.2022.
//

import UIKit

final class GameViewController: UIViewController, GameMainViewActionsDelegate {
    
    private let game = Game()
    private var records: [Record] = []
    private var arrayOfAnswer: [String] = []
    private var score: Int = 0
    private var lastGameScoreDate: Date!
    private var correctlyAnswer = "0"
    private var scoreLevel: Int = 100
    
    // MARK: -   let gameVC = GameViewController()
    let notificationCenter = NotificationCenter.default
    
    var mainView: GameMainView { return self.view as! GameMainView }
    
    var pressedFirstButton = false
    var pressedSecondButton = false
    var pressedThirdButton = false
    var pressedForthButton = false
    
    // MARK: - LifeCyrcle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mementoLoad()
        
        mainView.actionsDelegate = self
        
        mainView.onAddFirstButtonAction = { [weak self] in
            self?.addFirstButtonAction()
        }
        mainView.onAddSecondButtonAction = { [weak self] in
            self?.addSecondButtonAction()
        }
        mainView.onAddThirdButtonAction = { [weak self] in
            self?.addThirdButtonAction()
        }
        mainView.onAddForthButtonAction = { [weak self] in
            self?.addForthButtonAction()
        }
        mainView.onAddFailButtonsViews = { [weak self] in
            self?.addFailButtonAction()
        }
    }
    
    //    Рутовая вью
    override func loadView() {
        
        self.view = GameMainView(frame: UIScreen.main.bounds)
    }
    
    //    Notification Center
    override func viewWillDisappear(_ animated: Bool) {
        
        mementoSave()
        
//        let dict = ["score" : self.score]
//        notificationCenter.post(name: .lastValueScore, object: self, userInfo: dict)
    }
    //    MARK: - Momento Load
    private func mementoLoad() {
        
        let recordsCaretaker = RecordsCaretaker()
        let records = recordsCaretaker.retrieveRecords()
        score = records.last?.value ?? 0
    }
    
    //    MARK: - Momento Save
    private func mementoSave() {
        
        self.lastGameScoreDate = Date()
        let record = Record(date: self.lastGameScoreDate, value: self.score)
        self.records.append(record)
        //        let recordMemento = RecordMomento(records: records)
        let recordsCaretaker = RecordsCaretaker()
        recordsCaretaker.save(records: records)
    }
    
    private func allButtonsOff() {
        pressedFirstButton = false
        pressedSecondButton = false
        pressedThirdButton = false
        pressedForthButton = false
    }
    
    private func setScoreLabelText(button: UIButton) {
        
        if button.titleLabel?.text == self.correctlyAnswer {
            score += scoreLevel
        } else {
            score -= scoreLevel
        }
        
        switch score {
        
        case 0...999999:
            mainView.scoreLabel.text = "Вы выйграли \(score) рублей"
        
        case ...0 :
            mainView.scoreLabel.text = "ПРОЙГРЫШЬ!"
            score = 0
            mainView.questionLabel.text = "ИГРАЕМ ЕЩЕ!"
            
        default:
            mainView.scoreLabel.text = "ПОБЕДА!"
            score = 0
        }
    }
    
    func addFailButtonAction() {
        self.mainView.firstButton.setTitle("", for: .normal)
        self.mainView.firstButton.backgroundColor = .systemRed
        self.mainView.secondButton.setTitle("Еще раз?", for: .normal)
        self.mainView.thirdButton.setTitle("Да", for: .normal)
        self.mainView.forthButton.setTitle("Нет", for: .normal)
    }
    
    private func setButtonLabelText() {
        
        mainView.firstButton.setTitle("100", for: .normal)
        mainView.firstButton.backgroundColor = .darkGray
        mainView.secondButton.setTitle("1000", for: .normal)
        mainView.thirdButton.setTitle("10000", for: .normal)
        mainView.forthButton.setTitle("100000", for: .normal)
    }
    
    //    MARK: - GameMainViewActionsDelegate
    func addFirstButtonAction() {
        
        pressedFirstButton = !pressedFirstButton
        if !pressedSecondButton, !pressedThirdButton, !pressedForthButton {
            
            pressedFirstButton = true
            UIView.animate(withDuration: 0.5) {
                
                self.arrayOfAnswer = self.game.gameArray100[0]["answer"] as! [String]
                self.scoreLevel = self.game.gameArray100[0]["win"] as! Int
                self.correctlyAnswer = String(self.arrayOfAnswer[2])
                
                self.mainView.firstButton.setTitle(self.game.gameArray100[0]["question"] as? String, for: .normal)
                self.mainView.firstButton.backgroundColor = .red
                self.mainView.secondButton.setTitle(self.arrayOfAnswer[0], for: .normal)
                self.mainView.thirdButton.setTitle(self.arrayOfAnswer[1], for: .normal)
                self.mainView.forthButton.setTitle(self.arrayOfAnswer[2], for: .normal)
            }
        }
    }
    
    //    private func setButtonAndPropertiesGame() {
    //
    //        arrayOfAnswer = game.gameArray1000[0]["answer"] as! [String]
    //        self.scoreLevel = self.game.gameArray1000[0]["win"] as! Int
    //        self.correctlyAnswer = String(self.arrayOfAnswer[self.game.gameArray1000[0]["correctIndex"] as! Int])
    //
    //        self.mainView.firstButton.setTitle(self.game.gameArray1000[0]["question"] as? String, for: .normal)
    //        self.mainView.firstButton.backgroundColor = .red
    //        self.mainView.secondButton.setTitle(self.arrayOfAnswer[0], for: .normal)
    //        self.mainView.thirdButton.setTitle(self.arrayOfAnswer[1], for: .normal)
    //        self.mainView.forthButton.setTitle(self.arrayOfAnswer[2], for: .normal)
    //    }
    
    func addSecondButtonAction() {
        
        let button = mainView.secondButton
        
        if pressedForthButton || pressedFirstButton || pressedThirdButton || pressedSecondButton {
            
            pressedSecondButton = !pressedSecondButton
            UIView.animate(withDuration: 0.5) {
                
                self.setScoreLabelText(button: button)
                self.setButtonLabelText()
                self.allButtonsOff()
            }
        } else {
            pressedSecondButton = true
            UIView.animate(withDuration: 0.5) {
                
                self.arrayOfAnswer = self.game.gameArray1000[0]["answer"] as! [String]
                self.scoreLevel = self.game.gameArray1000[0]["win"] as! Int
                self.correctlyAnswer = String(self.arrayOfAnswer[self.game.gameArray1000[0]["correctIndex"] as! Int])
                
                self.mainView.firstButton.setTitle(self.game.gameArray1000[0]["question"] as? String, for: .normal)
                self.mainView.firstButton.backgroundColor = .red
                self.mainView.secondButton.setTitle(self.arrayOfAnswer[0], for: .normal)
                self.mainView.thirdButton.setTitle(self.arrayOfAnswer[1], for: .normal)
                self.mainView.forthButton.setTitle(self.arrayOfAnswer[2], for: .normal)
            }
        }
    }
    
    func addThirdButtonAction() {
        
        let button = mainView.thirdButton
        
        if pressedForthButton || pressedFirstButton || pressedThirdButton || pressedSecondButton {
            pressedThirdButton = !pressedThirdButton
            
            UIView.animate(withDuration: 0.5) {
                
                self.setScoreLabelText(button: button)
                self.setButtonLabelText()
                self.allButtonsOff()
            }
        } else {
            pressedThirdButton = true
            UIView.animate(withDuration: 0.5) {
                
                self.arrayOfAnswer = self.game.gameArray10000[0]["answer"] as! [String]
                self.scoreLevel = self.game.gameArray10000[0]["win"] as! Int
                self.correctlyAnswer = String(self.arrayOfAnswer[2])
                
                self.mainView.firstButton.setTitle(self.game.gameArray10000[0]["question"] as? String, for: .normal)
                self.mainView.firstButton.backgroundColor = .red
                self.mainView.secondButton.setTitle(self.arrayOfAnswer[0], for: .normal)
                self.mainView.thirdButton.setTitle(self.arrayOfAnswer[1], for: .normal)
                self.mainView.forthButton.setTitle(self.arrayOfAnswer[2], for: .normal)
            }
        }
    }
    
    func addForthButtonAction() {
        
        let button = mainView.forthButton
        
        if pressedForthButton || pressedFirstButton || pressedThirdButton || pressedSecondButton {
            pressedForthButton = !pressedForthButton
            
            UIView.animate(withDuration: 0.5) {
                
                self.setScoreLabelText(button: button)
                self.setButtonLabelText()
                self.allButtonsOff()
            }
        } else {
            pressedForthButton = true
            UIView.animate(withDuration: 0.5) {
                
                self.arrayOfAnswer = self.game.gameArray100000[0]["answer"] as! [String]
                self.scoreLevel = self.game.gameArray100000[0]["win"] as! Int
                self.correctlyAnswer = String(self.arrayOfAnswer[1])
                
                self.mainView.firstButton.setTitle(self.game.gameArray100000[0]["question"] as? String, for: .normal)
                self.mainView.firstButton.backgroundColor = .red
                self.mainView.secondButton.setTitle(self.arrayOfAnswer[0], for: .normal)
                self.mainView.thirdButton.setTitle(self.arrayOfAnswer[1], for: .normal)
                self.mainView.forthButton.setTitle(self.arrayOfAnswer[2], for: .normal)
            }
        }
    }
}
//
//extension NSNotification.Name {
//
//    static let lastValueScore = NSNotification.Name.init(rawValue: "lastValueScore")
//}
