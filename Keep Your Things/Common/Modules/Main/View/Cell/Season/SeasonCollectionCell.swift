//
//  SeasonCollectionCell.swift
//  Keep Your Things
//
//  Created by Александр on 23.04.2021.
//

import UIKit

class SeasonCollectionCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: Internal
    
    func configure(season: Season) {
        switch season {
        case .winter:
            imageView.image = UIImage(named: "WinterSeason")
            titleLabel.text = "Зима"
        case .spring:
            imageView.image = UIImage(named: "SpringSeason")
            titleLabel.text = "Весна"
        case .summer:
            imageView.image = UIImage(named: "SummerSeason")
            titleLabel.text = "Лето"
        case .fall:
            imageView.image = UIImage(named: "FallSeason")
            titleLabel.text = "Осень"
        }
    }

}
