//
//  MainViewController.swift
//  Keep Your Things
//
//  Created by Александр on 26.03.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    var presenter: MainViewOutput?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: Private
    private let roomCellReuseId = "RoomCollectionCell"
    private let tagCellReuseId = "TagCollectionCell"
    private let seasonCellReuseId = "SeasonCollectionCell"
    private let mainTitleHeaderReuseId = "MainTitleHeader"
    private let mainFooterViewReuseId = "MainFooterView"
    private let layoutProvider = MainLayoutProvider()
    private var collectionLayout: UICollectionViewCompositionalLayout?
    
    // MARK: View's lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.moduleWasLoad()
        configureCollection()
    }
    
    // MARK: Private methods
    
    private func configureCollection() {
        collectionView.register(UINib(nibName: "RoomCollectionCell", bundle: nil),
                                forCellWithReuseIdentifier: roomCellReuseId)
        collectionView.register(UINib(nibName: "TagCollectionCell", bundle: nil),
                                forCellWithReuseIdentifier: tagCellReuseId)
        collectionView.register(UINib(nibName: "SeasonCollectionCell", bundle: nil),
                                forCellWithReuseIdentifier: seasonCellReuseId)
        
        configureLayout()
    }
    
    private func configureLayout() {
        collectionView.register(UINib(nibName: "MainTitleHeader", bundle: nil),
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: mainTitleHeaderReuseId)
        collectionView.register(UINib(nibName: "MainFooterView", bundle: nil),
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                                withReuseIdentifier: mainFooterViewReuseId)
        collectionView.collectionViewLayout = layoutProvider.createLayout()
    }
    

}

extension MainViewController: MainViewInput {
    
}

extension MainViewController: UICollectionViewDelegate {
    
}

extension MainViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 5
        case 1:
            return 4
        case 2:
            return 8
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: roomCellReuseId, for: indexPath) as? RoomCollectionCell {
                return cell
            }
        case 1:
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: seasonCellReuseId, for: indexPath) as? SeasonCollectionCell,
               let season = Season(rawValue: indexPath.row) {
                
                cell.configure(season: season)
                return cell
            }
        default:
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: tagCellReuseId, for: indexPath) as? TagCollectionCell {
                
                var testStr = "First"
                for i in 0..<indexPath.row {
                    testStr.append(" \(i)")
                }
                cell.configure(text: testStr, color: UIColor.red)
                return cell
            }
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            if let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                          withReuseIdentifier: mainTitleHeaderReuseId,
                                                                          for: indexPath) as? MainTitleHeader {
                switch indexPath.section {
                case 0:
                    view.configure(title: "полки") {
                        print("header[\(indexPath.section)] touched")
                    }
                case 1:
                    view.configure(title: "сезонные вещи") {
                        print("header[\(indexPath.section)] touched")
                    }
                default:
                    break
                }
                return view
            }
        } else if let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                             withReuseIdentifier: mainFooterViewReuseId,
                                                                             for: indexPath) as? MainFooterView {
            return view
        }
        return UICollectionReusableView()
    }
}
