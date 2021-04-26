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
    private let chestCellReuseId = "ChestCollectionCell"
    private let tagCellReuseId = "TagCollectionCell"
    private let seasonCellReuseId = "SeasonCollectionCell"
    private let mainTitleHeaderReuseId = "MainTitleHeader"
    private let mainFooterViewReuseId = "MainFooterView"
    private let layoutProvider = MainLayoutProvider()
    private var collectionLayout: UICollectionViewCompositionalLayout?
    
    private var chests = [ChestCellObject]()
    private var seasons = [SeasonCellObject]()
    private var tags = [TagCellObject]()
    
    // MARK: View's lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.moduleWasLoad()
        configureCollection()
    }
    
    // MARK: Private methods
    
    private func configureCollection() {
        collectionView.register(UINib(nibName: "ChestCollectionCell", bundle: nil),
                                forCellWithReuseIdentifier: chestCellReuseId)
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

    func updateChests(chests: [ChestCellObject]) {
        self.chests = chests
        //collectionView.reloadSections(IndexSet(integer: 0))
        collectionView.reloadData()
    }
    
    func updateSeasons(seasons: [SeasonCellObject]) {
        self.seasons = seasons
        //collectionView.reloadSections(IndexSet(integer: 1))
        collectionView.reloadData()
    }
    
    func updateTags(tags: [TagCellObject]) {
        self.tags = tags
        //collectionView.reloadSections([2])
        collectionView.reloadData()
    }
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
            return chests.count
        case 1:
            return seasons.count
        case 2:
            return tags.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: chestCellReuseId, for: indexPath) as? ChestCollectionCell {
                cell.configure(thingsCount: chests[indexPath.row].thingsCount,
                               roomTitle: chests[indexPath.row].roomTitle)
                return cell
            }
        case 1:
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: seasonCellReuseId, for: indexPath) as? SeasonCollectionCell {
                cell.configure(season: seasons[indexPath.row].season)
                return cell
            }
        case 2:
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: tagCellReuseId, for: indexPath) as? TagCollectionCell {
                cell.configure(text: tags[indexPath.row].name,
                               color: UIColor.hexString(hex: tags[indexPath.row].backgroundColor))
                return cell
            }
        default:
            break
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
