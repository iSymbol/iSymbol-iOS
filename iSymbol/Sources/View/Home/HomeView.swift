//
//  HomeView.swift
//  iSymbol
//
//  Created by RAFA on 8/2/24.
//

import UIKit

final class HomeView: BaseView {
    
    // MARK: - Properties
    
    private let exampleLabel = UILabel()
    
    // MARK: - UI Configuration
    
    override func configureComponents() {
        exampleLabel.do {
            $0.text = "Example Text"
            $0.textColor = .black
            $0.textAlignment = .center
            $0.font = .systemFont(ofSize: 25, weight: .bold)
        }
    }
    
    override func addSubviews() {
        addSubview(exampleLabel)
    }
    
    override func setupConstraints() {
        exampleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
