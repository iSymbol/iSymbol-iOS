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

    @objc private func handleEmailLogin() {
        print("DEBUG: Email Login")
    }

    override func setButtonActions() {
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
