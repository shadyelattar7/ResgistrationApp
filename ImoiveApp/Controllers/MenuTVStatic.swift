//
//  TableVCStatic.swift
//  ImoiveApp
//
//  Created by Elattar on 7/15/19.
//

import UIKit

enum MenuType: Int {
    case profile
    case contactUs
    case logOut
    case delete
}

class MenuTVStatic: UITableViewController {

    var didTapMenuType: ((MenuType) -> Void)?
    
    @IBOutlet weak var image_img: UIImageView!
    @IBOutlet weak var name_lbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
       
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }

   
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = Bundle.main.loadNibNamed("CustomCell", owner: self, options: nil)?.first as! CustomCell
        let customProfileCell = Bundle.main.loadNibNamed("CustomProfileCell", owner: self, options: nil)?.first as! CustomProfileCell

        switch (indexPath.row) {
        case 0:
            customProfileCell.setProfile(name: ManagerUserDefault.shared.userData!.name, image: ManagerUserDefault.shared.userData!.image)
            return customProfileCell
        case 1:
            cell.setSetting(label: "Contact us", image: #imageLiteral(resourceName: "telephone"))
        case 2:
            cell.setSetting(label: "log out", image: #imageLiteral(resourceName: "exit"))
        case 3:
            cell.setSetting(label: "Delete Account", image: #imageLiteral(resourceName: "delete"))
            
        default:
            print("Error")
        }
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let menuType = MenuType(rawValue: indexPath.row) else {return}

        dismiss(animated: true){
            self.didTapMenuType?(menuType)
        }
        
    }
    

  
}
