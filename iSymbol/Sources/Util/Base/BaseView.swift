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
    
    // MARK: - UI Configuration
    
    func setupUI() { backgroundColor = .white }
    
    func configureComponents() {}
    
    func addSubviews() {}
    
    func setupConstraints() {}
}
