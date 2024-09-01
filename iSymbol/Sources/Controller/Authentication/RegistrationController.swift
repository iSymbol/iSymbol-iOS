//
//  RegistrationController.swift
//  iSymbol
//
//  Created by RAFA on 9/2/24.
//

import UIKit

final class RegistrationController: BaseViewController{

    // MARK: - Properties

    private let registrationView = RegistrationView()

    // MARK: - Lifecycle

    override func loadView() {
        view = registrationView
        title = "Sign Up"
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.systemYellow
        ]
    }
    // MARK: - Actions

    @objc private func textFieldsDidChange() {
        let username = registrationView.usernameTextField.text ?? ""
        let email = registrationView.emailTextField.text ?? ""
        let password = registrationView.pwTextField.text ?? ""
        let confirmPassword = registrationView.confirmPWTextField.text ?? ""
        let isUsernameValid = username.isValidUsername()
        let isEmailValid = email.isValidEmail()
        let isPasswordValid = password.isValidPassword()
        let isConfirmPasswordValid = confirmPassword.isValidConfirmPassword(password: password)

        if isUsernameValid && isEmailValid && isPasswordValid && isConfirmPasswordValid {
            registrationView.updateSignUpButton(isEnabled: true)
        } else {
            registrationView.updateSignUpButton(isEnabled: false)
        }
    }

    @objc private func handleSignUp() {
        print("DEBUG: Sign up button tapped..")
    }

    override func setButtonActions() {
        registrationView.usernameTextField.addTarget(
            self,
            action: #selector(textFieldsDidChange),
            for: .editingChanged
        )

        registrationView.emailTextField.addTarget(
            self,
            action: #selector(textFieldsDidChange),
            for: .editingChanged
        )

        registrationView.pwTextField.addTarget(
            self,
            action: #selector(textFieldsDidChange),
            for: .editingChanged
        )

        registrationView.confirmPWTextField.addTarget(
            self,
            action: #selector(textFieldsDidChange),
            for: .editingChanged
        )

        registrationView.signUpButton.addTarget(
            self,
            action: #selector(handleSignUp),
            for: .touchUpInside
        )
    }
}
