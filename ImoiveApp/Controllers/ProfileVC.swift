//
//  ProfileVC.swift
//  ImoiveApp
//
//  Created by Elattar on 7/7/19.
//

import UIKit
import MarqueeLabel
import SDWebImage

class ProfileVC: UIViewController {
    
    let transiton = SlideMenu()
    
    @IBOutlet weak var image_img: UIImageView!
    @IBOutlet weak var name_lbl: MarqueeLabel!
    @IBOutlet weak var address_lbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
        ManagerUserDefault.shared.isLogIn = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    
    func setupViews() {
      
        image_img.layer.masksToBounds = false
        image_img.layer.cornerRadius = image_img.frame.size.width / 2
        image_img.clipsToBounds = true
        address_lbl.text = ("  \(ManagerUserDefault.shared.userData!.address[0])")
        name_lbl.text = ("\(ManagerUserDefault.shared.userData!.name!)").capitalized
        image_img.image = ManagerUserDefault.shared.userData?.image
    }
    
    func deleteAccount()  {
        let def = UserDefaults.standard
        def.removeObject(forKey: UserDefaultKey.userData)
        def.synchronize()
        
        let signInVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignInVC") as! SignInVC
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window!.rootViewController = UINavigationController(rootViewController: signInVC)
        appDelegate.window!.makeKeyAndVisible()
    }
    
    func logOut (){
        ManagerUserDefault.shared.clearData()
        let signInVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignInVC") as! SignInVC
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window!.rootViewController = UINavigationController(rootViewController: signInVC)
        appDelegate.window!.makeKeyAndVisible()
    }
    
    func contactUsVC() {
        //        let contactUs = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ContactUsVC") as! ContactUsVC
        //        present(contactUs, animated: true, completion: nil)
        let contactUs = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ContactUsStaticVC") as! ContactUsStaticVC
        present(contactUs, animated: true, completion: nil)
        
    }
    
    @IBAction func showMenu_btn(_ sender: Any) {
        
        guard  let slideMenu = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MenuTVStatic") as? MenuTVStatic else {return}
        
        slideMenu.didTapMenuType = { menuType in
            self.transitionToNewContect(menuType)
        }
        
        slideMenu.modalPresentationStyle = .overCurrentContext
        slideMenu.transitioningDelegate = self
        present(slideMenu, animated: true, completion: nil)
    }
    
    func transitionToNewContect(_ menuType: MenuType) {
        
        let title = String(describing: menuType)
        navigationController?.title = title
        
        switch menuType {
        case .profile:
            print("Profile//")
        case .contactUs:
            contactUsVC()
            print("Contact us //")
        case .logOut:
            logOut()
            print("log out //")
        case .delete:
            alertDeleteAcc()
            print("Delete Account")
        }
        
    }
    
    func alertDeleteAcc(){
        
        let alert = UIAlertController(title: "Delete?", message: "Are you sure delete this accout", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { _ in
            print("Cancel")
        }))
        alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { (_) in
            self.deleteAccount()
        }))
        
        present(alert, animated: true, completion: nil)
    }
    
}


extension ProfileVC: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transiton.isPresenting = true
        return transiton
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transiton.isPresenting = false
        return transiton
    }
    
    
}
