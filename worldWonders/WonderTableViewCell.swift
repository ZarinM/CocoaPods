//
//  WonderTableViewCell.swift
//  worldWonders
//
//  Created by Зарина Муратова on 27.12.2025.
//

import UIKit
import SDWebImage

class WonderTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var professionLabel: UILabel!
   
    
    @IBOutlet weak var pictureImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        pictureImageView.layer.cornerRadius = 16

        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setData(wonder: WorldWonder) {
        nameLabel.text = wonder.name
        professionLabel.text = wonder.profession
        pictureImageView.sd_setImage(with: URL(string:wonder.picture))

        
    }

}
