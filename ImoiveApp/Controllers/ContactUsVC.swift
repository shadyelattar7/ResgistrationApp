//
//  ContactUs.swift
//  ImoiveApp
//
//  Created by Elattar on 7/19/19.
//

import UIKit

class ContactUsVC: UIViewController {

    @IBOutlet weak var contactUs_lbl: UILabel!
    @IBOutlet weak var viewX: UIView!
    @IBOutlet weak var address1_lbl: UILabel!
    @IBOutlet weak var address2_lbl: UILabel!
    @IBOutlet weak var phone_lbl: UILabel!
    @IBOutlet weak var email_lbl: UILabel!
    @IBOutlet weak var degree1_img: UILabel!
    @IBOutlet weak var degree2_img: UILabel!
    @IBOutlet weak var icon1_img: UIImageView!
    @IBOutlet weak var icon2_img: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contactUs_lbl.layer.cornerRadius = 20.0
       // viewX.layer.cornerRadius = 20.0
        
//        address1_lbl.text = ("\(ManagerUserDefault.shared.userData!.address[0]) \n\(ManagerUserDefault.shared.userData!.address[1])" )
//      
//        phone_lbl.text = ManagerUserDefault.shared.userData?.phone
//        email_lbl.text = ManagerUserDefault.shared.userData?.email
//       
    }
    

    @IBAction func close_btn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
