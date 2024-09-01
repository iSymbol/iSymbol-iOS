//
//  LoginIntroController.swift
//  iSymbol
//
//  Created by RAFA on 9/1/24.
//

import AuthenticationServices
import UIKit

final class LoginIntroController: BaseViewController {

    // MARK: - Properties

    private let loginIntroView = LoginIntroView()

    // MARK: - Lifecycle

    override func loadView() {
        view = loginIntroView
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    // MARK: - Actions

    @objc private func navigateToLoginView() {
        let loginVC = LoginController()
        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .white
        navigationController?.pushViewController(loginVC, animated: true)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    @objc private func handleAppleLogin() {
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]

        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.performRequests()
    }

    override func setButtonActions() {
        loginIntroView.emailLoginButton.addTarget(
            self,
            action: #selector(navigateToLoginView),
            for: .touchUpInside
        )

        loginIntroView.appleLoginButton.addTarget(
            self,
            action: #selector(handleAppleLogin),
            for: .touchUpInside
        )
    }
}

// MARK: - ASAuthorizationControllerDelegate

extension LoginIntroController: ASAuthorizationControllerDelegate {

    func authorizationController(
        controller: ASAuthorizationController,
        didCompleteWithAuthorization authorization: ASAuthorization
    ) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            let userIdentifier = appleIDCredential.user
            let fullName = appleIDCredential.fullName
            let email = appleIDCredential.email

            print("User ID: \(userIdentifier)")
            if let fullName = fullName {
                print("User Full Name: \(fullName)")
            }
            if let email = email {
                print("User Email: \(email)")
            }
        }
    }

    func authorizationController(
        controller: ASAuthorizationController,
        didCompleteWithError error: Error
    ) {
        print("Failed to authenticate via Apple: \(error.localizedDescription)")
    }
}
