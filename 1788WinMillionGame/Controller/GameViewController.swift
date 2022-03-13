//
//  ViewController.swift
//  1788WinMillionGame
//
//  Created by Nikolai Krusser on 26.02.2022.
//

import UIKit

final class GameViewController: UIViewController, GameMainViewActionsDelegate {
    
    var delegate: GameSessionDelegate?
    
    private let dataProvider = GameDataProvider()
    private var question: GameModel?
    private var questionsButtons: [Int: ActionButton]?
    private var answersButtons: [Int: ActionButton]?
    
    private var questionText: String?
    private var scoreLabelText: String?
    private var score: Int = 0
    private var lastGameScoreDate: Date!
    private var correctlyAnswer = "0"
    private var scoreLevel: Int = 100
    private var stringResult: String?
    
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
        
        delegate?.addTotalQuestions(count: dataProvider.getQuestionsCount())
        
        try? Game.instance.results = GameCaretaker<[GameSessionResult]>().retrieveRecords() ?? [GameSessionResult]()
        
        stringResult = getResults()
        print(stringResult ?? "архив пуст")
        
        score = Game.instance.results.last?.winMoney ?? 0

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
    }
    
    //    Рутовая вью
    override func loadView() {
        self.view = GameMainView(frame: UIScreen.main.bounds)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setButtons()
    }
    
    //    сохраняем данные по закрытию приложения
    override func viewWillDisappear(_ animated: Bool) {
        saveGameData()
    }
    
    //    метод получения массива сессий прошлых игр - статистика
    private func getResults() -> String {
        return Game.instance.results.isEmpty ? "архив пуст" :
            Game.instance.results.map { $0.description() }
            .reversed()
            .joined(separator: "\n")
    }
    
    //    массивы кнопок для настройки через перебор
    private func setButtons() {
        
        questionsButtons = [1: mainView.firstButton,
                            2: mainView.secondButton,
                            3: mainView.thirdButton,
                            4: mainView.forthButton]
        
        answersButtons = [1: mainView.secondButton,
                          2: mainView.thirdButton,
                          3: mainView.forthButton]
    }
    
    private func setGameLabelText(question: GameModel?) -> Bool {
        
        guard let question = question else { return false }
        questionText = question.question
        scoreLabelText = "You are win \(delegate?.getScore() ?? 0)"
        return true
    }
    
    private func setQuestion(question: GameModel?) {
        
        guard let question = question else { return }
        questionText = question.question
        questionsButtons?.forEach {
            
            if $0.value.titleLabel?.text == String(question.questionPrice) {
                self.mainView.firstButton.setTitle(question.question, for: .normal)
                self.mainView.firstButton.backgroundColor = .systemRed
                self.mainView.questionLabel.text = "выберите ответ"
                self.scoreLevel = question.questionPrice
            }
        }
        answersButtons?.forEach {
            $0.value.setTitle(question.answers[$0.key], for: .normal)
        }
    }
    
//    сброс маячков всех кнопок
    private func allButtonsOff() {
        pressedFirstButton = false
        pressedSecondButton = false
        pressedThirdButton = false
        pressedForthButton = false
    }
    
// настройка текста в лейблах с информацией по игре
    private func setScoreLabelText(button: UIButton) {
        
        if button.titleLabel?.text == self.correctlyAnswer {
            
            score += scoreLevel
        } else {
            score -= scoreLevel
        }
        
        switch score {
        
        case 0...999999:
            mainView.scoreLabel.backgroundColor = .systemBlue
            mainView.scoreLabel.text = "Вы выйграли \(score) рублей"
            mainView.questionLabel.text = "выберите категорию вопроса"
            
        case ...0 :
            mainView.scoreLabel.text = "ПРОЙГРЫШЬ!"
            mainView.scoreLabel.backgroundColor = .systemGray3
            score = 0
            mainView.questionLabel.text = "ИГРАЕМ ЕЩЕ! выберите категорию вопроса"
            saveGameData()
            
        default:
            mainView.scoreLabel.backgroundColor = .systemRed
            mainView.scoreLabel.text = "ПОБЕДА!"
            score = 0
            saveGameData()
        }
    }
    
    private func saveGameData() {
        
        Game.instance.setupResults()
    }
    
    private func setButtonLabelText() {
        
        mainView.firstButton.setTitle("100", for: .normal)
        mainView.firstButton.backgroundColor = .darkGray
        mainView.secondButton.setTitle("1000", for: .normal)
        mainView.thirdButton.setTitle("10000", for: .normal)
        mainView.forthButton.setTitle("100000", for: .normal)
    }
    
    private func pressedButtonAnswer(button: ActionButton, pressed: inout Bool) {
        
        pressed = true
        
        UIView.animate(withDuration: 0.5) {
            
            self.question = self.dataProvider.getQuestion(priceQuestion: Int(button.titleLabel?.text ?? "0") ?? 0)
            self.setQuestion(question: self.question)
            guard let correctIndex = self.question?.validAnswerId else { return }
            guard let answer = self.question?.answers else { return }
            self.correctlyAnswer = answer[correctIndex] ?? ""
        }
    }
    
    private func pressedButtonQuestion(button: ActionButton) {
        
        UIView.animate(withDuration: 0.5) {
            self.setScoreLabelText(button: button)
            self.setButtonLabelText()
            self.allButtonsOff()
            self.delegate?.addDidAnswerToQuestion(questionPrice: self.scoreLevel)
            
        }
    }
    
    //    MARK: - GameMainViewActionsDelegate
    func addFirstButtonAction() {
        
        pressedFirstButton = !pressedFirstButton
        
        if !pressedSecondButton, !pressedThirdButton, !pressedForthButton {
            
            pressedButtonAnswer(button: mainView.firstButton, pressed: &pressedFirstButton)
        }
    }
    
    func addSecondButtonAction() {
        
        if pressedForthButton || pressedFirstButton || pressedThirdButton || pressedSecondButton {
            
            pressedButtonQuestion(button: mainView.secondButton)
        } else {
            pressedButtonAnswer(button: mainView.secondButton, pressed: &pressedSecondButton)
        }
    }
    
    func addThirdButtonAction() {
        
        if pressedForthButton || pressedFirstButton || pressedThirdButton || pressedSecondButton {
            
            pressedButtonQuestion(button: mainView.thirdButton)
        } else {
            pressedButtonAnswer(button: mainView.thirdButton, pressed: &pressedThirdButton)
        }
    }
    
    func addForthButtonAction() {
        
        if pressedForthButton || pressedFirstButton || pressedThirdButton || pressedSecondButton {
            
            pressedButtonQuestion(button: mainView.forthButton)
        } else {
            pressedButtonAnswer(button: mainView.forthButton, pressed: &pressedForthButton)
        }
    }
}
