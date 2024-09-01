//
//  RegistrationView.swift
//  iSymbol
//
//  Created by RAFA on 9/2/24.
//

import UIKit

final class RegistrationView: BaseView {

    // MARK: - Properties

    let usernameTextField = CustomTextField(
        placeholder: "Username",
        isPassword: false,
        isLogin: false
    )
    let emailTextField = CustomTextField(placeholder: "Email", isPassword: false, isLogin: false)
    let pwTextField = CustomTextField(placeholder: "Password", isPassword: true, isLogin: false)
    let confirmPWTextField = CustomTextField(
        placeholder: "Confirm Password",
        isPassword: true,
        isLogin: false
    )
    let credentialsStackView = UIStackView()
    let signUpButton = UIButton(type: .system)

    override func configureComponents() {
        credentialsStackView.do {
            $0.addArrangedSubview(usernameTextField)
            $0.addArrangedSubview(emailTextField)
            $0.addArrangedSubview(pwTextField)
            $0.addArrangedSubview(confirmPWTextField)
            $0.axis = .vertical
            $0.alignment = .fill
            $0.distribution = .fillEqually
            $0.spacing = 10
        }

        signUpButton.do {
            $0.backgroundColor = .buttonColor
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 10
            $0.isEnabled = true
            $0.setAttributedTitle(
                NSAttributedString(
                    string: "Login",
                    attributes: [
                        .font: UIFont.systemFont(ofSize: 20, weight: .medium),
                        .foregroundColor: UIColor.white
                    ]
                ),
                for: .normal
            )
        }
    }

    override func addSubviews() {
        [credentialsStackView, signUpButton].forEach {
            addSubview($0)
        }
    }

    override func setupConstraints() {
        credentialsStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(20)
            $0.left.equalTo(16)
        }

        signUpButton.snp.makeConstraints {
            $0.centerX.left.equalTo(credentialsStackView)
            $0.bottom.equalTo(keyboardLayoutGuide.snp.top).offset(-10)
            $0.height.equalTo(50)
        }
    }
}
