//
//  OnboardingView.swift
//  iSymbol
//
//  Created by ohseungyeon on 9/2/24.
//

import UIKit

final class OnboardingView: BaseView {
    
    
    private let titleLabel = UILabel()
    let startButton = UIButton()
    let descriptionStackView = UIStackView()

    var descriptionLabels: [UILabel] = []
    var checkButtons: [UIButton] = []
    
    override func configureComponents() {
        
        // 임시 배경
        self.backgroundColor = .darkGray
        
        titleLabel.do {
            let label = UILabel()
            $0.text = "iSymbol에 오신 것을 환영합니다!"
            $0.font = UIFont.boldSystemFont(ofSize: 40)
            $0.textColor = .white
            $0.numberOfLines = 0
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        startButton.do{
            let button = UIButton()
            $0.setTitle("Start", for: .normal)
            $0.backgroundColor = .systemGreen
            $0.layer.cornerRadius = 10
            $0.isHidden = true // 처음에는 숨김
            
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        descriptionStackView.do{
            $0.axis = .vertical
            $0.spacing = 10
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

    }
    
    override func addSubviews() {
        [titleLabel, descriptionStackView, startButton].forEach {
            addSubview($0)
        }
    }
    
    override func setupConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(100)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        descriptionStackView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(300)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        startButton.snp.makeConstraints {
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(50)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(1000)
            $0.height.equalTo(100)
        }
    }
    
    func setupOnboardingItems(_ items: [OnboardingItem]) {
        for (index, item) in items.enumerated() {
            let checkButton = UIButton(type: .system)
            checkButton.do {
                $0.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
                $0.tintColor = item.color
                checkButtons.append($0)
            }

            let label = UILabel()
            label.do {
                $0.text = item.text
                $0.textColor = item.color
                $0.font = UIFont.systemFont(ofSize: 20)
                $0.numberOfLines = 0
                descriptionLabels.append($0)
            }
            
            let stackView = UIStackView(arrangedSubviews: [checkButton, label])
            stackView.do {
                $0.spacing = 10
                $0.alignment = .center
                descriptionStackView.addArrangedSubview($0)
            }
        }
    }
}
