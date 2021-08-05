//
//  UIHelpers.swift
//  testProject
//
//  Created by talgat on 8/5/21.
//

import UIKit

class UIHelpers {
    
    static func showAlert(withTitle title: String, message: String, buttonTitle: String, handler: ((UIAlertAction) -> Void)?) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: buttonTitle, style: .default, handler: handler)
        alertController.addAction(okAction)
        return alertController
    }
    
}
