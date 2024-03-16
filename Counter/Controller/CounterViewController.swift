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
        result.font = UIFont.systemFont(ofSize: 24)
        return result
        
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
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(plusButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    }()
    
    lazy var minusButton: UIButton = {
        let button = UIButton()
        button.setTitle("-", for: .normal)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(minusButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setConstraints()
        
    }
    
    
    //MARK: - Private Methods
    
    private func setLayout() {
        view.addSubview(yandexImageView)
        view.addSubview(result)
        view.addSubview(plusButton)
        view.addSubview(minusButton)
    }
    
    
    @obj private func plusButtonPressed()
    
}
    
    @obj private func minusButtonPressed()
        
    
}
}

    //MARK: - Constraints
    
    extension CounterViewController {
        private func setConstraints() {
            NSLayoutConstraint.activate([
                
                yandexImageView.topAnchor.constraint(equalTo: view.topAnchor),
                yandexImageView.leadingAnchor.constraint(equalTo: view.leftAnchor),
                yandexImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                yandexImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                
                
                result.topAnchor.constraint(equalTo: view.topAnchor, constant: 170),
                result.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                result.heightAnchor.constraint(equalToConstant: 320),
                result.widthAnchor.constraint(equalToConstant: 260),
                
                
                plusButton.topAnchor.constraint(equalTo: minusButton.bottomAnchor, constant:  100),
                plusButton.centerXAnchor.constraint(equalTo: view.leftAnchor),
                plusButton.heightAnchor.constraint(equalToConstant: 80),
                plusButton.widthAnchor.constraint(equalToConstant: 270),
                
                
                minusButton.topAnchor.constraint(equalTo: plusButton.bottomAnchor,constant: 20),
                minusButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                minusButton.heightAnchor.constraint(equalToConstant: 70),
                minusButton.widthAnchor.constraint(equalToConstant: 240),
                
            ])
            
        }
    }
