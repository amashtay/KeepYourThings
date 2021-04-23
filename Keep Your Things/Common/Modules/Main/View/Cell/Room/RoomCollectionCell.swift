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
    @IBOutlet weak var gradientView: UIView!
    
    private let gradientLayer = CAGradientLayer()
    
    // MARK: Overriden
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupGradientLayer()
    }
    
    override var isHighlighted: Bool {
        didSet {
            shrinkWithAnimation(enabled: isHighlighted)
        }
    }
    
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
    
    
    // MARK: Private
    
    private func setupGradientLayer() {
        gradientLayer.frame = gradientView.bounds
        gradientLayer.colors = [UIColor.white.cgColor, UIColor.clear.cgColor]
        gradientLayer.locations = [0.0, 0.7]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
        gradientView.layer.addSublayer(gradientLayer)
    }
}
