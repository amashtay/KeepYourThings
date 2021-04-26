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
        backgroundColor = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 0.1)
    }
    
    func configure(text: String?,
                   color: UIColor? = nil) {
        label.text = text
        if let color = color {
            backgroundColor = color.withAlphaComponent(0.1)
        }
    }

}
