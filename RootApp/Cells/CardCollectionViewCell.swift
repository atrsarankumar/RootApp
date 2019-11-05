//
//  CardCollectionViewCell.swift
//  RootApp
//
//  Created by Sarankumar on 04/11/19.
//  Copyright © 2019 Saran. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {

    @IBOutlet var imageview: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(countryList: CountryList)  {
        self.imageview.image = UIImage(named: "play")
        self.nameLabel.text = countryList.name
    }
}
