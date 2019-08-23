//
//  ContactUsStaticVC.swift
//  ImoiveApp
//
//  Created by Elattar on 7/22/19.
//

import UIKit

class ContactUsStaticVC: UIViewController {

    @IBOutlet weak var lbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
       lbl.layer.masksToBounds = true
       lbl.layer.cornerRadius = 5
    }
    

    
    
    @IBAction func close_btn(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    

}
