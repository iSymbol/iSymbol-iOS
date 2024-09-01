//
//  CustomTextField.swift
//  iSymbol
//
//  Created by RAFA on 9/2/24.
//

import UIKit

import SnapKit

final class CustomTextField: UITextField {

    // MARK: - Properties

    private let togglePasswordVisibilityButton = UIButton(type: .system)
    private let leftPadding = UIView()
    private let rightPadding = UIView()

    // MARK: - Initializer

    init(placeholder: String, isPassword: Bool, isLogin: Bool) {
        super.init(frame: .zero)

        leftPadding.snp.makeConstraints {
            $0.width.equalTo(12)
            $0.height.equalTo(50)
        }

        leftView = leftPadding
        leftViewMode = .always

        borderStyle = .none
        textColor = .white
        tintColor = isLogin ? .systemIndigo : .systemYellow
        keyboardAppearance = .dark
        keyboardType = .emailAddress
        backgroundColor = .white.withAlphaComponent(0.1)
        attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [.foregroundColor: UIColor(white: 1, alpha: 0.7)]
        )
        isSecureTextEntry = isPassword
        textContentType = .oneTimeCode
        autocapitalizationType = .none
        autocorrectionType = .no
        spellCheckingType = .no
        clipsToBounds = true
        layer.cornerRadius = 10

        snp.makeConstraints {
            $0.height.equalTo(50)
        }

        if isPassword {
             configurePasswordToggle()
         }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Actions

    @objc private func togglePasswordVisibility() {
        isSecureTextEntry.toggle()

        let imageName = isSecureTextEntry ? "eye" : "eye.slash"
        togglePasswordVisibilityButton.setImage(UIImage(systemName: imageName), for: .normal)
    }

    // MARK: - Helpers

    private func configurePasswordToggle() {
        var config = UIButton.Configuration.plain()
        config.image = UIImage(systemName: "eye")
        config.imagePadding = 10
        config.baseForegroundColor = .white

        togglePasswordVisibilityButton.configuration = config
        togglePasswordVisibilityButton.addTarget(
            self,
            action: #selector(togglePasswordVisibility),
            for: .touchUpInside
        )

        rightView = togglePasswordVisibilityButton
        rightViewMode = .always
    }

    override var isSecureTextEntry: Bool {
        didSet {
            if isFirstResponder {
                _ = becomeFirstResponder()
            }
        }
    }

    @discardableResult
    override func becomeFirstResponder() -> Bool {
        let success = super.becomeFirstResponder()
        if isSecureTextEntry, let text = self.text {
            self.text?.removeAll()
            insertText(text)
        }

        return success
    }
}
