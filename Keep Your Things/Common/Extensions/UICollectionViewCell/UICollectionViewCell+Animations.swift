//
//  UICollectionViewCell+Animations.swift
//  Keep Your Things
//
//  Created by Александр on 26.03.2021.
//
import UIKit

extension UICollectionViewCell {

    func shrinkWithAnimation(enabled: Bool) {
        UIView.animate(withDuration: 1.0,
                       delay: 0.0,
                       usingSpringWithDamping: 0.4,
                       initialSpringVelocity: 0.0,
                       options: [.allowUserInteraction, .curveEaseIn]) {
            self.transform = enabled ? CGAffineTransform(scaleX: 0.9, y: 0.9) : .identity
        }
    }
    
}
