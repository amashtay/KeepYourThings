//
//  StoryCell.swift
//  Keep Your Things
//
//  Created by Александр on 26.03.2021.
//

import UIKit

class StoryCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    var isRead = true
    
    private let markedBorderColor = UIColor(red: 0.1, green: 0.63, blue: 0.95, alpha: 1.0).cgColor
    private let unmarkedBorderColor = UIColor(red: 0.34, green: 0.35, blue: 0.38, alpha: 0.4).cgColor
    
    
    // MARK: Overriden
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 12
        setState(enabled: false)
    }
    
    override var isHighlighted: Bool {
        didSet {
            shrinkWithAnimation(enabled: isHighlighted)
        }
    }
    
    // MARK: Internal

    func configure(with model: StoryCellObject) {
        isRead = model.isRead
        title.text = model.title
        //imageView.image = nil
        
        setState(enabled: !isRead)
    }
    
    // MARK: Private
    
    private func setState(enabled: Bool) {
        layer.borderWidth = enabled ? 4 : 2
        layer.borderColor = enabled ? markedBorderColor : unmarkedBorderColor
    }

}
