//
//  BirdCell.swift
//  AngryBirds
//
//  Created by Chelsea Troy on 4/13/20.
//  Copyright © 2020 Chelsea Troy. All rights reserved.
//

import UIKit

class BirdCell: UITableViewCell {

    @IBOutlet weak var birdNameLabel: UILabel!
    @IBOutlet weak var birdDescriptionLael: UILabel!
    @IBOutlet weak var birdImageView: UIImageView!
    
    var bird: Bird? {
        didSet {
            self.birdNameLabel.text = bird?.name
            self.birdDescriptionLael.text = bird?.description
            self.accessoryType = bird!.confirmedSighting ? .checkmark : .none
            
            DispatchQueue.global(qos: .userInitiated).async {
                let defaultImageData = NSData(contentsOf: URL(string: "https://static.wikia.nocookie.net/angrybirds/images/3/31/Red.png/revision/latest?cb=20220331060717")!)
                let birdImageData = NSData(contentsOf: URL(string: self.bird!.imageUrl)!)
                
                DispatchQueue.main.async {
                    if birdImageData != nil {
                        self.birdImageView.image = UIImage(data: birdImageData as! Data)
                    } else {
                        self.birdImageView.image = UIImage(data: defaultImageData as! Data)
                    }
                    
                    self.birdImageView.layer.cornerRadius = self.birdImageView.frame.width / 2
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
