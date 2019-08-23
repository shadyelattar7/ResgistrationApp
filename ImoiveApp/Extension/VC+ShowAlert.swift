//
//  VC+ShowAlert.swift
//  ImoiveApp
//
//  Created by Elattar on 7/7/19.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showAlert(title: String, massage: String)  {
        
        let actionAlert = UIAlertController(title: title, message: massage, preferredStyle: .alert)
        actionAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(actionAlert, animated: true, completion: nil)
    }
}
