//
//  UIButton+Login.swift
//  iSymbol
//
//  Created by RAFA on 9/2/24.
//

import UIKit

extension UIButton {

    func attributedTitle(firstPart: String, secondPart: String) {
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
            .font: UIFont.systemFont(ofSize: 16)
        ]

        let attributedTitle = NSMutableAttributedString(
            string: "\(firstPart) ",
            attributes: attributes
        )

        let boldString: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.systemYellow,
            .font: UIFont.boldSystemFont(ofSize: 16)
        ]

        attributedTitle.append(NSAttributedString(string: secondPart, attributes: boldString))

        setAttributedTitle(attributedTitle, for: .normal)
    }
}
