//
//  MainTitleHeader.swift
//  Keep Your Things
//
//  Created by Александр on 23.04.2021.
//

import UIKit

class MainTitleHeader: UICollectionReusableView {

    @IBOutlet weak var titleLabel: UILabel!
    
    var action: (()->())?
    
    func configure(title: String?,
                   action: (()->())?) {
        titleLabel.text = title
        self.action = action
    }
    
    @IBAction func addButtonTouched(_ sender: Any) {
        action?()
    }
}
