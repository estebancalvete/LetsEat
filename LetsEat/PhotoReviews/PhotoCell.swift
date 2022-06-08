//
//  PhotoReviewCell.swift
//  LetsEat
//
//  Created by Esteban Calvete Iglesias on 8/6/22.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    @IBOutlet var photoReview: UIImageView!
}

extension PhotoCell {
    func set(image: UIImage) {
        photoReview.image = image
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        photoReview.layer.cornerRadius = 9
        photoReview.layer.masksToBounds = true
    }
}
