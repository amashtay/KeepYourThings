//
//  XibView.swift
//  Keep Your Things
//
//  Created by Александр on 23.03.2021.
//
import UIKit

class XibView: UIView {

    @IBOutlet weak var contentView: UIView!
    
    // MARK: Inits

    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customInit()
    }

    // Настроить View
    private func customInit() {
        let thisType = type(of: self)
        let nibName = String(describing: thisType)
        Bundle.main.loadNibNamed(nibName,
                                 owner: self,
                                 options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.configureView()
    }

    
    // MARK: Internal
    
    func configureView() {

    }

}
