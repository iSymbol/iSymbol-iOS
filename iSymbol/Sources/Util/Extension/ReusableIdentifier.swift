//
//  ReusableIdentifier.swift
//  iSymbol
//
//  Created by RAFA on 8/9/24.
//

import UIKit

protocol ReusableIdentifier: AnyObject { }

extension ReusableIdentifier where Self: UIView {
    
    static var identifier: String {
        return String(describing: self)
    }
}

extension UITableViewHeaderFooterView: ReusableIdentifier { }

extension UITableViewCell: ReusableIdentifier { }

extension UICollectionReusableView: ReusableIdentifier { }
