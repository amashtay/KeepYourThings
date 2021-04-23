//
//  RoomCollectionCell.swift
//  Keep Your Things
//
//  Created by Александр on 23.04.2021.
//

import UIKit

class RoomCollectionCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var thingsCountLabel: UILabel!
    @IBOutlet weak var roomTitleLabel: UILabel!
    

    // MARK: Internal
    
    func configure(image: UIImage? = nil,
                   thingsCount: Int,
                   roomTitle: String) {
        if image != nil {
            imageView.image = image
        }
        thingsCountLabel.text = "\(thingsCount)"
        roomTitleLabel.text = roomTitle
    }
}
