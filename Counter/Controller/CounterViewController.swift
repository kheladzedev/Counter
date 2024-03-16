//
//  ViewController.swift
//  Counter
//
//  Created by Edward on 14.03.2024.
//

import UIKit

final class CounterViewController: UIViewController {
    
    //MARK: - Elements
    
    private let result: UILabel = {
        let result = UILabel()
        result.translatesAutoresizingMaskIntoConstraints = false
        result.text = "0"
        result.font = UIFont.systemFont(ofSize: 35)
        return result
        
    }()
    
    private let historyTextView: UITextView = {
            let textView = UITextView()
            textView.translatesAutoresizingMaskIntoConstraints = false
            textView.isEditable = false
            return textView
        }()
    
    private let yandexImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"Yandex")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        
    }()
    
    //MARK: - Buttons
    
    lazy var plusButton: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(plusButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    }()
    
    lazy var minusButton: UIButton = {
        let button = UIButton()
        button.setTitle("-", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        button.backgroundColor = .systemRed
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(minusButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    }()
    
    lazy var resetButton: UIButton = {
        let button = UIButton()
        button.setTitle("reset", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.backgroundColor = .black
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(resetButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    }()
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setConstraints()
        view.backgroundColor = .white
    }
    
    //MARK: - Private Methods
    
    private func setLayout() {
        view.addSubview(yandexImageView)
        view.addSubview(result)
        view.addSubview(historyTextView)
        view.addSubview(plusButton)
        view.addSubview(minusButton)
        view.addSubview(resetButton)
    }
    
    @objc private func plusButtonPressed() {
        let newValue = (Int(result.text ?? "0") ?? 0) + 1
            result.text = "\(newValue)"
            updateHistory(with: "Значение изменено на +1")
        }
    
    @objc private func minusButtonPressed() {
        let currentValue = Int(result.text ?? "0") ?? 0
            if currentValue > 0 {
                let newValue = currentValue - 1
                result.text = "\(newValue)"
                updateHistory(with: "Значение изменено на -1")
            } else {
                updateHistory(with: "Значение изменено на -1")
            }
        }
    
    @objc private func resetButtonPressed() {
            result.text = "0"
            updateHistory(with: "Значение сброшено")
        }
    
    
    private func updateHistory(with message: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        let dateString = dateFormatter.string(from: Date())
        let historyMessage = "[\(dateString)]: \(message)\n"
        historyTextView.text.append(historyMessage)
        let bottom = NSMakeRange(historyTextView.text.count - 1, 1)
        historyTextView.scrollRangeToVisible(bottom)
    }


    
    //MARK: - Constraints
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            yandexImageView.heightAnchor.constraint(equalToConstant: 400),
            yandexImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -150),
            yandexImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            yandexImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            
            result.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            result.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
            historyTextView.topAnchor.constraint(equalTo: result.bottomAnchor, constant: 20),
            historyTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            historyTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            historyTextView.bottomAnchor.constraint(equalTo: plusButton.topAnchor, constant: -20),
            
            
            plusButton.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: 80),
            plusButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            plusButton.widthAnchor.constraint(equalToConstant: 180),
            plusButton.heightAnchor.constraint(equalToConstant: 70),
           
            
            minusButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 80),
            minusButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            minusButton.widthAnchor.constraint(equalToConstant: 180),
            minusButton.heightAnchor.constraint(equalToConstant: 70),
            
            
            resetButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 600),
            resetButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),       resetButton.widthAnchor.constraint(equalToConstant: 180),
            resetButton.heightAnchor.constraint(equalToConstant: 70),
            

        ])
    }
    
}
