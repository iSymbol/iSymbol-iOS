//
//  String+Authentication.swift
//  iSymbol
//
//  Created by RAFA on 9/2/24.
//

import Foundation

extension String {

    func isValidEmail() -> Bool {
        let emailRegEx = "^[A-Z0-9a-z._%+-]+@[A-Z0-9a-z.-]+\\.[A-Za-z]{2,}$"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }

    func isValidPassword() -> Bool {
        let passwordRegEx = "(?=.*[A-Za-z])(?=.*[0-9]).{8,20}"
        let passwordPred = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return passwordPred.evaluate(with: self)
    }

    func isValidConfirmPassword(password: String) -> Bool {
        return self == password
    }

    func isValidUsername() -> Bool {
        let usernameRegEx = "^(?:(?=.*[A-Za-z])[A-Za-z]{3,16}|[가-힣]{2,8})$"
        let usernamePred = NSPredicate(format:"SELF MATCHES %@", usernameRegEx)
        return usernamePred.evaluate(with: self)
    }
}
