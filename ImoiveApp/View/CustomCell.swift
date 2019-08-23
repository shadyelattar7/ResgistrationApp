//
//  CustomCell.swift
//  ImoiveApp
//
//  Created by Elattar on 7/19/19.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var image_img: UIImageView!
    @IBOutlet weak var name_lbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func setSetting(label: String, image: UIImage) {
        image_img.image = image
        name_lbl.text = label
    }
    
 
}
