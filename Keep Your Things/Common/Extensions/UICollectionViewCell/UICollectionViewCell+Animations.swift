//
//  UICollectionViewCell+Animations.swift
//  Keep Your Things
//
//  Created by Александр on 26.03.2021.
//
import UIKit

extension UICollectionViewCell {

    func shrinkWithAnimation(enabled: Bool) {
        UIView.animate(withDuration: 0.3,
                       delay: 0.0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0.0,
                       options: [.allowUserInteraction, .curveEaseIn]) {
            self.transform = enabled ? CGAffineTransform(scaleX: 0.95, y: 0.95) : .identity
        }
    }
    
}
