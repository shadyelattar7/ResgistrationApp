//
//  TableViewCell.swift
//  ImoiveApp
//
//  Created by Elattar on 7/22/19.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var icon_img: UIImageView!
    @IBOutlet weak var title_lbl: UILabel!
    @IBOutlet weak var data_lbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setData (title: String, data: String, icon: UIImage){
        
        title_lbl.text = title
        data_lbl.text = data
        icon_img.image = icon
    }
}
