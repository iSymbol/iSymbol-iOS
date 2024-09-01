//
//  LoginIntroView.swift
//  iSymbol
//
//  Created by RAFA on 9/1/24.
//

import AuthenticationServices
import UIKit

final class LoginIntroView: BaseView {

    // MARK: - Properties

    private let titleLabel = UILabel()
    let emailLoginButton = UIButton()
    let appleLoginButton = ASAuthorizationAppleIDButton(
        authorizationButtonType: .continue,
        authorizationButtonStyle: .white
    )
    private let basicLoginButtonStackView = UIStackView()
    private let orLabel = UILabel()
    let googleLoginButton = UIButton(type: .system)
    let gitHubLoginButton = UIButton(type: .system)
    private let additionalLoginButtonStackView = UIStackView()

    // MARK: - Set UI

    override func configureComponents() {
        titleLabel.do {
            $0.text = "hello\niSymbol !"
            $0.textColor = .white
            $0.textAlignment = .center
            $0.numberOfLines = 0
            $0.font = UIFont(name: "Pacifico-Regular", size: 70)
        }

        emailLoginButton.do {
            var config = UIButton.Configuration.plain()
            config.image = UIImage(systemName: "envelope.fill")?
                .withConfiguration(UIImage.SymbolConfiguration(pointSize: 10))
            config.imagePlacement = .leading
            config.imagePadding = 5
            config.baseForegroundColor = .white

            $0.setAttributedTitle(
                NSAttributedString(
                    string: "Continue with Email",
                    attributes: [.font: UIFont.systemFont(ofSize: 20, weight: .medium)]
                ),
                for: .normal
            )
            $0.configuration = config
            $0.backgroundColor = .buttonColor
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 10
        }

        appleLoginButton.do {
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 10
        }

        basicLoginButtonStackView.do {
            $0.addArrangedSubview(emailLoginButton)
            $0.addArrangedSubview(appleLoginButton)
            $0.axis = .vertical
            $0.alignment = .fill
            $0.distribution = .fillEqually
            $0.spacing = 10
        }

        orLabel.do {
            $0.text = "or"
            $0.textColor = .lightGray
            $0.textAlignment = .center
        }

        googleLoginButton.do {
            $0.setBackgroundImage(UIImage(named: "google"), for: .normal)
            $0.clipsToBounds = true
            $0.layer.cornerRadius = self.frame.width / 2
        }

        gitHubLoginButton.do {
            $0.setBackgroundImage(UIImage(named: "gitHub"), for: .normal)
            $0.clipsToBounds = true
            $0.layer.cornerRadius = self.frame.width / 2
        }

        additionalLoginButtonStackView.do {
            $0.addArrangedSubview(googleLoginButton)
            $0.addArrangedSubview(gitHubLoginButton)
            $0.axis = .horizontal
            $0.alignment = .fill
            $0.distribution = .fillEqually
            $0.spacing = 15
        }
    }

    override func addSubviews() {
        [titleLabel, basicLoginButtonStackView, orLabel, additionalLoginButtonStackView].forEach {
            addSubview($0)
        }
    }

    override func setupConstraints() {
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(10)
            $0.left.equalTo(16)
        }

        emailLoginButton.snp.makeConstraints {
            $0.height.equalTo(50)
        }

        basicLoginButtonStackView.snp.makeConstraints {
            $0.centerX.left.equalTo(titleLabel)
        }


        orLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(basicLoginButtonStackView.snp.bottom).offset(30)
        }

        addDividerLines(around: orLabel)

        googleLoginButton.snp.makeConstraints {
            $0.size.equalTo(50)
        }

        additionalLoginButtonStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(orLabel.snp.bottom).offset(30)
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-50)
        }
    }

    // MARK: - Helpers

    private func addDividerLines(around label: UILabel) {
        addDividerLine(alignment: .left, relativeTo: label, offset: -8)
        addDividerLine(alignment: .right, relativeTo: label, offset: 8)
    }

    private func addDividerLine(
        alignment: NSLayoutConstraint.Attribute,
        relativeTo label: UILabel,
        offset: CGFloat
    ) {
        let line = UIView()
        line.backgroundColor = .lightGray
        addSubview(line)

        line.snp.makeConstraints {
            $0.centerY.equalTo(label)
            switch alignment {
            case .left:
                $0.left.equalToSuperview()
                $0.right.equalTo(label.snp.left).offset(offset)
            case .right:
                $0.left.equalTo(label.snp.right).offset(offset)
                $0.right.equalToSuperview()
            default:
                break
            }
            $0.height.equalTo(1)
        }
    }
}
