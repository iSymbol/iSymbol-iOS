//
//  LoginView.swift
//  iSymbol
//
//  Created by RAFA on 9/2/24.
//

import UIKit

final class LoginView: BaseView {

    // MARK: - Properties

    let emailTextField = CustomTextField(placeholder: "Email", isPassword: false, isLogin: true)
    let pwTextField = CustomTextField(placeholder: "Password", isPassword: true, isLogin: true)
    let createAccountButton = UIButton(type: .system)
    let loginFormStackView = UIStackView()
    let loginButton = UIButton(type: .system)

    // MARK: - Set UI

    override func configureComponents() {
        createAccountButton.do {
            $0.attributedTitle(firstPart: "Don't have an account? ", secondPart: "Sign Up")
        }

        loginFormStackView.do {
            $0.addArrangedSubview(emailTextField)
            $0.addArrangedSubview(pwTextField)
            $0.addArrangedSubview(createAccountButton)
            $0.axis = .vertical
            $0.alignment = .fill
            $0.distribution = .fillEqually
            $0.spacing = 10
        }

        loginButton.do {
            $0.backgroundColor = .buttonColor.withAlphaComponent(0.4)
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 10
            $0.isEnabled = false
            $0.setAttributedTitle(
                NSAttributedString(
                    string: "Login",
                    attributes: [
                        .font: UIFont.systemFont(ofSize: 20, weight: .medium),
                        .foregroundColor: UIColor.white.withAlphaComponent(0.4)
                    ]
                ),
                for: .normal
            )
        }
    }

    override func addSubviews() {
        [loginFormStackView, loginButton].forEach {
            addSubview($0)
        }
    }

    override func setupConstraints() {
        loginFormStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(20)
            $0.left.equalTo(16)
        }

        loginButton.snp.makeConstraints {
            $0.centerX.left.equalTo(loginFormStackView)
            $0.bottom.equalTo(keyboardLayoutGuide.snp.top).offset(-10)
            $0.height.equalTo(50)
        }
    }

    // MARK: - Helpers

    func updateLoginButton(isEnabled: Bool) {
        loginButton.do {
            $0.isEnabled = isEnabled
            $0.backgroundColor = isEnabled ? .buttonColor : .buttonColor.withAlphaComponent(0.4)
            $0.setAttributedTitle(
                NSAttributedString(
                    string: "Login",
                    attributes: [
                        .font: UIFont.systemFont(ofSize: 20, weight: .medium),
                        .foregroundColor: isEnabled ? .white : UIColor.white.withAlphaComponent(0.4)
                    ]
                ),
                for: .normal
            )
        }
    }
}
