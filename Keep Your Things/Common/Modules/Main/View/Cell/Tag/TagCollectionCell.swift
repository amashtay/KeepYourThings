//
//  TagCollectionCell.swift
//  Keep Your Things
//
//  Created by Александр on 27.03.2021.
//

import UIKit

class TagCollectionCell: UICollectionViewCell {

    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 4
        backgroundColor = UIColor.gray
    }
    
    func configure(text: String?,
                   color: UIColor? = nil) {
        label.text = text
        if let color = color {
            label.tintColor = color
        }
    }

}
