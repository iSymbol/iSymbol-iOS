//
//  BaseView.swift
//  iSymbol
//
//  Created by RAFA on 8/2/24.
//

import UIKit

import SnapKit
import Then

class BaseView: UIView {

    // MARK: - Properties

    private let gradientLayer = CAGradientLayer()

    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        configureComponents()
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        applyGradientBackground()
    }

    // MARK: - UI Configuration
    
    func setupUI() {}
    
    func configureComponents() {}
    
    func addSubviews() {}
    
    func setupConstraints() {}
}

private extension BaseView {

    func applyGradientBackground() {
        gradientLayer.colors = [
            UIColor.subColor.cgColor,
            UIColor.mainColor.cgColor
        ]

        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = bounds

        layer.insertSublayer(gradientLayer, at: 0)
    }
}
