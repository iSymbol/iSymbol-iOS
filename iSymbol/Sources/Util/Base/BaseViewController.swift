//
//  BaseViewController.swift
//  iSymbol
//
//  Created by RAFA on 8/2/24.
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setButtonActions()
    }
    
    // MARK: - Actions

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    func setButtonActions() {}
}
