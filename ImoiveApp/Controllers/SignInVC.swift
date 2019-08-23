//
//  ViewController.swift
//  ImoiveApp
//
//  Created by Elattar on 7/7/19.
//

import UIKit

class SignInVC: UIViewController {
    
    
    
    // Animtion////////////////////////////////////////
    @IBOutlet weak var emailHide_lbl: UILabel!
    @IBOutlet weak var emailHide_img: UIImageView!
    @IBOutlet weak var passHide_img: UIImageView!
    @IBOutlet weak var passHide_lbl: UILabel!
    ////////////////////////////////////////////////
    @IBOutlet weak var emailAlart_lbl: UILabel!
    @IBOutlet weak var passwordAlart_lbl: UILabel!
    @IBOutlet weak var signIn_btn: UIButton!
    @IBOutlet weak var email_tf: UITextField!
    @IBOutlet weak var password_tf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signIn_btn.layer.cornerRadius = 20.0
        email_tf.delegate = self
        password_tf.delegate = self
        email_tf.lineDesign()
        password_tf.lineDesign()
        self.navigationItem.title = "Sign In"
        
    }
    
    
    
    
    private func vaildateFildes (email: String, password: String) -> Bool  {
        
        if email.isBlank || password.isBlank{
            if email.isBlank && password.isBlank{
                Status.errorStatus(txt: emailHide_lbl, img_lbl: emailHide_img, img: #imageLiteral(resourceName: "mailError"))
                email_tf.lineDesignColor(color: UIColor.errorRed)
                Status.errorStatus(txt: passHide_lbl, img_lbl: passHide_img, img: #imageLiteral(resourceName: "lockError"))
                password_tf.lineDesignColor(color: UIColor.errorRed)
                return false
                
            }else if (email.isBlank){
                Status.errorStatus(txt: emailHide_lbl, img_lbl: emailHide_img, img: #imageLiteral(resourceName: "mailError"))
                email_tf.lineDesignColor(color: UIColor.errorRed)
                return false
            }else{
                Status.errorStatus(txt: passHide_lbl, img_lbl: passHide_img, img: #imageLiteral(resourceName: "lockError"))
                password_tf.lineDesignColor(color: UIColor.errorRed)
                return false
            }
        }
        
        if !Validation.isValidEmail(emailAddressString: email){
            emailAlart_lbl.text = "Please enter a valid email address"
            Status.errorStatus(txt: emailHide_lbl, img_lbl: emailHide_img, img: #imageLiteral(resourceName: "mailError"))
            email_tf.lineDesignColor(color: UIColor.errorRed)
            
           if  Validation.isValidPassword(password: password){
            passwordAlart_lbl.text = ""
            Status.okStatus(txt: passHide_lbl, img_lbl: passHide_img, img: #imageLiteral(resourceName: "lockOk"))
            password_tf.lineDesignColor(color: UIColor.okGreen)
            }
            
            return false
            
        }else{
            emailAlart_lbl.text = ""
            Status.okStatus(txt: emailHide_lbl, img_lbl: emailHide_img, img: #imageLiteral(resourceName: "mailOk"))
            email_tf.lineDesignColor(color: UIColor.okGreen)
        }
        
        if !Validation.isValidPassword(password: password){
            passwordAlart_lbl.text = "Your password must be at least 8 characters long."
            Status.errorStatus(txt: passHide_lbl, img_lbl: passHide_img, img: #imageLiteral(resourceName: "lockError"))
            password_tf.lineDesignColor(color: UIColor.errorRed)
            return false
            
        }else{
            passwordAlart_lbl.text = ""
            Status.okStatus(txt: passHide_lbl, img_lbl: passHide_img, img: #imageLiteral(resourceName: "lockOk"))
            password_tf.lineDesignColor(color: UIColor.okGreen)
        }
        
        return true
    }
    
    // MARK:- SignIn Button
    @IBAction func signIn_btn(_ sender: Any) {
        
        let email = (email_tf.text!)
        let password = (password_tf.text!)
        
        
        if vaildateFildes(email: email, password: password) == false{
            print("Errorrr ->>>>>>>>>>>")
        }else{
   
        if (ManagerUserDefault.shared.userData?.email) == nil && (ManagerUserDefault.shared.userData?.password) == nil{
            
            self.showAlert(title: "Sorry", massage: "This email is not exist Please go to singUp")
            
        }else{
            
            guard let cachedEmail = ManagerUserDefault.shared.userData?.email as? String, email == cachedEmail ,let cachedPass = ManagerUserDefault.shared.userData?.password as? String, password == cachedPass  else {
                
                Status.errorStatus(txt: emailHide_lbl, img_lbl: emailHide_img, img: #imageLiteral(resourceName: "mailError"))
                email_tf.lineDesignColor(color: UIColor.errorRed)
                Status.errorStatus(txt: passHide_lbl, img_lbl: passHide_img, img: #imageLiteral(resourceName: "lockError"))
                password_tf.lineDesignColor(color: UIColor.errorRed)

                self.showAlert(title: "Sorry", massage: "Enter Valid Email or Password, This email is not exist")
                return
            }
            
            
        }
        
        let profileVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
        
        self.navigationController?.pushViewController(profileVc, animated: true)
        }
    }
    
    // MARK:- SignUp Button
    @IBAction func signUp_btn(_ sender: Any) {
        
        let signupVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignUpVC") as! SignUpVC
        
        self.navigationController?.pushViewController(signupVC, animated: true)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    
}


extension SignInVC: UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == email_tf {
            email_tf.placeholder = ""
            emailHide_lbl.text = "Email address"
            emailHide_lbl.fadeTransition(0.5)
            emailHide_img.image = #imageLiteral(resourceName: "mail")
            emailHide_img.fadeTransition(0.5)
            emailHide_lbl.textColor = UIColor .gray
            email_tf.lineDesignColor(color: .gray)
            
        }
        
        if textField == password_tf{
            password_tf.placeholder = ""
            passHide_lbl.text = "password"
            passHide_lbl.fadeTransition(0.5)
            passHide_img.image = #imageLiteral(resourceName: "lock-2")
            passHide_img.fadeTransition(0.5)
            passHide_lbl.textColor = UIColor .gray
            password_tf.lineDesignColor(color: .gray)
            
        }
        
    }
}
