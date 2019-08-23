//
//  SignUp.swift
//  ImoiveApp
//
//  Created by Elattar on 7/7/19.
//

import UIKit

class SignUpVC: UIViewController {
    
//Image Animtion////////////////////////////////////
    @IBOutlet weak var user_img: UIImageView!
    @IBOutlet weak var email_img: UIImageView!
    @IBOutlet weak var password_img: UIImageView!
    @IBOutlet weak var address_img: UIImageView!
    @IBOutlet weak var phone_img: UIImageView!
    
////////////////////////////////////////////////////
    @IBOutlet weak var signUp_btn: UIButton!
    @IBOutlet weak var image_img: UIImageView!
    @IBOutlet weak var name_tf: UITextField!
    @IBOutlet weak var email_tf: UITextField!
    @IBOutlet weak var password_tf: UITextField!
    @IBOutlet weak var address_tf: UITextField!
    @IBOutlet weak var address_tf2: UITextField!
    @IBOutlet weak var phone_tf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signUp_btn.layer.cornerRadius = 20.0
        
        name_tf.lineDesign()
        email_tf.lineDesign()
        password_tf.lineDesign()
        address_tf.lineDesign()
        address_tf2.lineDesign()
        phone_tf.lineDesign()
        
        self.navigationItem.title = "Sing Up"

      
    }
    
  
    override func viewWillAppear(_ animated: Bool) {
        
        let pasteboardString: String? = UIPasteboard.general.string
        guard let theString = pasteboardString else {return}
            
        image_img.sd_setImage(with: URL(string: "\(theString)"), placeholderImage: UIImage(named: "facebook"))
    }
    
    
    func saveCredentials(name: String,email: String,password: String,address: [String], phone: String,img: UIImage) {
        
        let userData = User.init(name: name, email: email, password: password, address: address, phone: phone ,image: img )
        
        ManagerUserDefault.shared.userData = userData
        
    }
    
    //MARK:- Picker Image
    @IBAction func pickImage(_ sender: Any) {
        
        let pickerImg = UIImagePickerController()
            pickerImg.delegate = self
        
        let actionAlart = UIAlertController(title: "PickerIamge", message: "picker image to profile", preferredStyle: .actionSheet)
        
        actionAlart.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action: UIAlertAction) in
          
            if UIImagePickerController.isSourceTypeAvailable(.camera){
            pickerImg.allowsEditing = false
            pickerImg.sourceType = .camera
            self.present(pickerImg, animated: true, completion: nil)
            }else{
                self.showAlert(title: "Sorry", massage: "Camera is not Available")
            }
            
        }))
        actionAlart.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action: UIAlertAction) in
            pickerImg.allowsEditing = false
            pickerImg.sourceType = .photoLibrary
            self.present(pickerImg, animated: true, completion: nil)
        }))
        
        actionAlart.addAction(UIAlertAction(title: "From Web", style: .default, handler: { (action: UIAlertAction) in
            
            let webView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WebVc") as! WebVc
            
            self.present(webView, animated: true, completion: nil)
        }))
        
        actionAlart.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler:nil))
        
        present(actionAlart, animated: true, completion: nil)
        
    }
    
    
    func allBlank (){
        user_img.image = #imageLiteral(resourceName: "usersError")
        name_tf.lineDesignColor(color: UIColor .errorRed)
        email_img.image = #imageLiteral(resourceName: "mailError")
        email_tf.lineDesignColor(color: UIColor .errorRed)
        password_img.image = #imageLiteral(resourceName: "lockError")
        password_tf.lineDesignColor(color: UIColor .errorRed)
        address_img.image = #imageLiteral(resourceName: "placeholderError")
        address_tf.lineDesignColor(color: UIColor .errorRed)
        address_tf2.lineDesignColor(color: UIColor .errorRed)
        phone_img.image = #imageLiteral(resourceName: "phoneError")
        phone_tf.lineDesignColor(color: UIColor .errorRed)
    }
    
    private func vaildateFildes (name: String,email: String,password: String,address: [String], phone: String,image: UIImage){
        
         let placeHolderImage = UIImage(named: "add")
        
        if (name.isBlank || email.isBlank || password.isBlank || address[0].isBlank || address[1].isBlank || phone.isBlank || image == placeHolderImage){
            
            if (name.isBlank && email.isBlank && password.isBlank && address[0].isBlank && address[1].isBlank && phone.isBlank && image == placeHolderImage){
                self.showAlert(title: "Sorry", massage: "all fields is Empty")
            }else if name.isBlank {
                self.showAlert(title: "Sorry", massage: "name is empty")
            }else if email.isBlank{
                self.showAlert(title: "Sorry", massage: "email is empty")
            }else if (password.isBlank){
                self.showAlert(title: "Sorry", massage: "password is empty")
            }else if (address[0].isBlank || address[1].isBlank){
                self.showAlert(title: "Sorry", massage: "address is empty")
            }else if (phone.isBlank){
                self.showAlert(title: "Sorry", massage: "phone is empty")
            }else{
                self.showAlert(title: "Sorry", massage: "Image is empty")
            }
        }
            
            if !Validation.isValidEmail(emailAddressString: email){
                self.showAlert(title: "Sorry", massage: "Please enter a valid email address")
            }
            
            if !Validation.isValidPassword(password: password){
                self.showAlert(title: "Sorry", massage: "Your password must be at least 8 characters long. Please try another")
            }
        
    }
    
    //MARK:- registration button
    @IBAction func signUp_btn(_ sender: Any) {
        
        let name = name_tf.text!
        let email = email_tf.text!
        let password = password_tf.text!
        var address: [String] = []
        address.append(address_tf.text!)
        address.append(address_tf2.text!)
        let phone = phone_tf.text!
        let img = image_img.image
      
        

     vaildateFildes(name: name, email: email, password: password, address: address, phone: phone, image: img!)
     saveCredentials(name: name, email: email, password: password, address: address, phone: phone,img: img!)
     self.navigationController?.popViewController(animated: true)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}



//MARK:- Extensions
extension SignUpVC : UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectImg = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {return}
        image_img.image = selectImg
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}



