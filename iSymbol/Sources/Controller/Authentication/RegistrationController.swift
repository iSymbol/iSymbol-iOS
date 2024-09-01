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
}
