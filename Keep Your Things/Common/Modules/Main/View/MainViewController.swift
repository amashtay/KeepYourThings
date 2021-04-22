//
//  MainViewController.swift
//  Keep Your Things
//
//  Created by Александр on 26.03.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: Private
    private let storyCellReuseId = "StoryCell"
    private let tagCellReuseId = "TagCollectionCell"
    private var collectionLayout: UICollectionViewCompositionalLayout?
    
    // MARK: View's lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollection()
    }
    
    // MARK: Private methods
    
    private func configureCollection() {
        collectionView.register(UINib(nibName: "StoryCell", bundle: nil),
                                forCellWithReuseIdentifier: storyCellReuseId)
        collectionView.register(UINib(nibName: "TagCollectionCell", bundle: nil),
                                forCellWithReuseIdentifier: tagCellReuseId)
        
        configureLayout()
    }
    
    private func configureLayout() {
        collectionView.collectionViewLayout = createLayout()
    }
    
    
    private func createLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { [weak self] (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            switch sectionIndex {
            case 0: return self?.createStoriesLayout()
            case 1: return self?.defaultLayout()
            case 2: return self?.createTagsLayout()
            default: return self?.defaultLayout()
            }
        }
    }
    
    
    private func createStoriesLayout() -> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 12.0, leading: 12.0, bottom: 12.0, trailing: 12.0)
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .absolute(86.0)),
            subitem: item,
            count: 1)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
    
    private func defaultLayout() -> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 12.0, leading: 12.0, bottom: 12.0, trailing: 12.0)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),  heightDimension: .estimated(70))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 12, bottom: 0, trailing: 12)
        return section
    }
    
    
    private func createTagsLayout() -> NSCollectionLayoutSection {
        let estimatedHeight: CGFloat = 44
        let estimatedWidth: CGFloat = 100
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(estimatedWidth),
                                              heightDimension: .estimated(estimatedHeight))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        item.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: .fixed(2), top: .fixed(4), trailing: .fixed(2), bottom: .fixed(4))
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .estimated(estimatedHeight))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        return section
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
            return 16
        case 1:
            return 4
        case 2:
            return 8
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (indexPath.section == 2) {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: tagCellReuseId, for: indexPath) as? TagCollectionCell {
                
                var testStr = "First"
                for i in 0..<indexPath.row {
                    testStr.append(" \(i)")
                }
                cell.configure(text: testStr, color: UIColor.red)
                return cell
            }
        }
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: storyCellReuseId, for: indexPath) as? StoryCell {
            return cell
        }
        return UICollectionViewCell()
    }
    
    
}
