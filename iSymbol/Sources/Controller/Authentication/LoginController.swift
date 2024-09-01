//
//  LoginController.swift
//  iSymbol
//
//  Created by RAFA on 9/2/24.
//

import UIKit

final class LoginController: BaseViewController {

    // MARK: - Properties

    private let loginView = LoginView()

    // MARK: - Lifecycle

    override func loadView() {
        view = loginView
        title = "Login"
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
    }

    // MARK: - Actions

    @objc private func navigateToRegistrationView() {
        let registrationVC = RegistrationController()
        navigationItem.backButtonTitle = ""
        navigationController?.pushViewController(registrationVC, animated: true)
    }

    @objc private func textFieldsDidChange() {
        let email = loginView.emailTextField.text ?? ""
        let password = loginView.pwTextField.text ?? ""
        let isEmailValid = email.isValidEmail()
        let isPasswordValid = password.isValidPassword()

        if isEmailValid && isPasswordValid {
            loginView.updateLoginButton(isEnabled: true)
        } else {
            loginView.updateLoginButton(isEnabled: false)
        }
    }

    @objc private func handleEmailLogin() {
        let email = "test0@gmail.com"
        let pw = "test0000"

        if loginView.emailTextField.text == email && loginView.pwTextField.text == pw {
            let homeVC = HomeController()
            let nav = UINavigationController(rootViewController: homeVC)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: true)
        }
    }

    override func setButtonActions() {
        loginView.emailTextField.addTarget(
            self,
            action: #selector(textFieldsDidChange),
            for: .editingChanged
        )

        loginView.pwTextField.addTarget(
            self,
            action: #selector(textFieldsDidChange),
            for: .editingChanged
        )

        loginView.createAccountButton.addTarget(
            self,
            action: #selector(navigateToRegistrationView),
            for: .touchUpInside
        )

        loginView.loginButton.addTarget(
            self,
            action: #selector(handleEmailLogin),
            for: .touchUpInside
        )
    }
}
