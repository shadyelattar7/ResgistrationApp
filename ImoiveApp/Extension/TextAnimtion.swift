//
//  TextAnimation.swift
//  ImoiveApp
//
//  Created by Elattar on 7/21/19.
//

import Foundation
import UIKit


class Status {
    
   static func okStatus(txt: UILabel , img_lbl: UIImageView , img: UIImage)  {
        txt.textColor = UIColor .okGreen
        img_lbl.image = img
    }
    static func errorStatus (txt: UILabel , img_lbl: UIImageView , img: UIImage){
        txt.textColor = UIColor .errorRed
        img_lbl.image = img
    }
    
   
}


extension UIView {
    func fadeTransition(_ duration:CFTimeInterval) {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name:
            CAMediaTimingFunctionName.easeInEaseOut)
        animation.type = CATransitionType.fade
        animation.duration = duration
        layer.add(animation, forKey: CATransitionType.fade.rawValue)
    }
}


extension UITextField{
    
    func lineDesign() {
        let Line = CALayer()
        Line.frame = CGRect(x: 0, y: self.frame.height - 2, width: self.frame.width, height: 1)
       // emailLine.backgroundColor = UIColor(red: 48/255, green: 173/255, blue: 99/255, alpha: 1).cgColor
        Line.backgroundColor = UIColor .lightGray .cgColor
        self.borderStyle = .none
        self.layer.addSublayer(Line)
    }
    
    func lineDesignColor(color: UIColor)  {
        let Line = CALayer()
        Line.frame = CGRect(x: 0, y: self.frame.height - 2, width: self.frame.width, height: 2)
        Line.backgroundColor = color .cgColor
        self.borderStyle = .none
        self.layer.addSublayer(Line)
    }
}



