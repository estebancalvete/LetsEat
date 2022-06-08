//
//  ExploreCell.swift
//  LetsEat
//
//  Created by Esteban Calvete Iglesias on 30/5/22.
//

import UIKit

class ExploreCell: UICollectionViewCell {
    
    @IBOutlet var exploreImageView: UIImageView!
    @IBOutlet var exploreNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        exploreImageView.layer.cornerRadius = 9
        exploreImageView.layer.masksToBounds = true
    }
}
