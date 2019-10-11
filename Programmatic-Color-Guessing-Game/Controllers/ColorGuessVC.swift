//
//  ColorGuessVC.swift
//  Programmatic-Color-Guessing-Game
//
//  Created by Liana Norman on 10/10/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import UIKit

class ColorGuessVC: UIViewController {

    // MARK: - UI Objects
    lazy var colorBox: UIView = {
        let cb = UIView()
        cb.backgroundColor = .black
        return cb
    }()
    
    lazy var numericScoreLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemPink
        label.textColor = .black
        label.text = "Your Score: "
        return label
    }()
    
    lazy var gameOverLabel: UILabel = {
       let label = UILabel()
        label.backgroundColor = .yellow
        label.textColor = .black
        return label
    }()
    
    lazy var numericHighScoreLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemPink
        label.textColor = .black
        return label
    }()
    
    lazy var redButton: UIButton = {
      let button = UIButton()
        button.setTitleColor(.red, for: .normal)
        button.setTitle("Red", for: .normal)
        button.addTarget(self, action: #selector(anyButtonPressed(_:)), for: .touchUpInside)
        button.isEnabled = true
        button.tag = 0
        // TODO: - Add Target
        return button
    }()
    
    lazy var greenButton: UIButton = {
      let button = UIButton()
        button.setTitleColor(.green, for: .normal)
        button.setTitle("Green", for: .normal)
        button.addTarget(self, action: #selector(anyButtonPressed(_:)), for: .touchUpInside)
        button.isEnabled = true
        button.tag = 1
        // TODO: - Add Target
        return button
    }()
    
    lazy var blueButton: UIButton = {
      let button = UIButton()
        button.setTitleColor(.blue, for: .normal)
        button.setTitle("Blue", for: .normal)
        button.addTarget(self, action: #selector(anyButtonPressed(_:)), for: .touchUpInside)
        button.isEnabled = true
        button.tag = 2
        // TODO: - Add Target
        return button
    }()
    
    lazy var newGameButton: UIButton = {
      let button = UIButton()
        button.setTitleColor(.systemPink, for: .normal)
        button.setTitle("New Game", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(anyButtonPressed(_:)), for: .touchUpInside)
        button.backgroundColor = .systemPink
        button.isEnabled = true
        button.tag = 3
        // TODO: - Add Target
        return button
    }()
    
    // MARK: - Properties
    var model = RGB()
    var score = 0
    var highScore = 0
    
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO: Take out background color when tesint the final product
        self.view.backgroundColor = .white
        configureUIView()
        configureButtons()
        configureNewGameButtonAndGameOverLabel()
        configureScoreLabels()
    }
    
    // MARK: - Private Methods
    private func updateScore() {
        score += 1
        numericScoreLabel.text = "Your Score: \(score)"
    }

    private func updateHighScoreLabel() {
        if score > highScore {
            numericHighScoreLabel.text = "High Score: \(score)"
        } else {
            numericHighScoreLabel.text = "High Score: \(highScore)"
        }
    }
    
    private func generateRandomColor() {
        model = RGB()
        colorBox.backgroundColor = model.randomColor()
    }
    
    private func resetGame() {
        numericScoreLabel.text = "Your Score: \(score)"
        gameOverLabel.isHidden = false
        newGameButton.isHidden = false
    }
    
    // MARK: - ObjC Methods
    @objc func anyButtonPressed(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            if model.highestColor() == UIColor.red {
                updateScore()
                generateRandomColor()
            } else {
                resetGame()
                updateHighScoreLabel()
            }
        case 1:
            if model.highestColor() == UIColor.green {
                updateScore()
                generateRandomColor()
            } else {
                resetGame()
                updateHighScoreLabel()
            }
            
        case 2:
            if model.highestColor() == UIColor.blue {
                updateScore()
                generateRandomColor()
            } else {
               resetGame()
                updateHighScoreLabel()
            }
        case 3:
            score = 0
            resetGame()
            generateRandomColor()
            gameOverLabel.isHidden = true
            newGameButton.isHidden = true
        default:
            print("Something is wrong")
        }
    }
    
    
    // MARK: - Constraint Methods
    private func configureUIView() {
        view.addSubview(colorBox)
        colorBox.translatesAutoresizingMaskIntoConstraints = false
        
        [colorBox.centerYAnchor.constraint(equalTo: view.centerYAnchor), colorBox.centerXAnchor.constraint(equalTo: view.centerXAnchor), colorBox.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor), colorBox.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor), colorBox.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.3)].forEach({$0.isActive = true })
    }
    
    private func configureButtons() {
        let stackView = UIStackView(arrangedSubviews: [redButton, greenButton, blueButton])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.distribution = .fillEqually
        view.addSubview(stackView)
        
        [stackView.topAnchor.constraint(equalTo: colorBox.bottomAnchor), stackView.heightAnchor.constraint(equalTo: colorBox.heightAnchor, multiplier: 0.3), stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor), stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)].forEach({$0.isActive = true})
    }
    
    private func configureNewGameButtonAndGameOverLabel() {
        let stackView = UIStackView(arrangedSubviews: [gameOverLabel, newGameButton])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.distribution = .fillEqually
        view.addSubview(stackView)
        
        [stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
         stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor), stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor), stackView.heightAnchor.constraint(equalTo: colorBox.heightAnchor, multiplier: 0.3)].forEach({$0.isActive = true})
    }
    
    private func configureScoreLabels() {
           let stackView = UIStackView(arrangedSubviews: [numericScoreLabel, numericHighScoreLabel])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.distribution = .fillEqually
        view.addSubview(stackView)
        
        [stackView.bottomAnchor.constraint(equalTo: colorBox.topAnchor), stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor), stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor), stackView.heightAnchor.constraint(equalTo: colorBox.heightAnchor, multiplier: 0.3)].forEach({$0.isActive = true})
       }
    
    
}


