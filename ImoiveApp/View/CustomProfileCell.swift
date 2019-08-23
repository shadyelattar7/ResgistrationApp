//
//  CustomProfileCell.swift
//  ImoiveApp
//
//  Created by Elattar on 7/19/19.
//

import UIKit

class CustomProfileCell: UITableViewCell {

    @IBOutlet weak var proImage_img: UIImageView!
    @IBOutlet weak var name_lbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
           
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
       
        
    }
    
    
    
    func setProfile(name: String,image: UIImage )  {
        proImage_img.layer.masksToBounds = false
        proImage_img.layer.cornerRadius = proImage_img.bounds.height / 2
        proImage_img.clipsToBounds = true
        proImage_img.image = image
        name_lbl.text = name
        
        
       
    }
}
