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
    private let roomCellReuseId = "RoomCollectionCell"
    private let tagCellReuseId = "TagCollectionCell"
    private let mainTitleHeaderReuseId = "MainTitleHeader"
    private var collectionLayout: UICollectionViewCompositionalLayout?
    
    // MARK: View's lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollection()
    }
    
    // MARK: Private methods
    
    private func configureCollection() {
        collectionView.register(UINib(nibName: "RoomCollectionCell", bundle: nil),
                                forCellWithReuseIdentifier: roomCellReuseId)
        collectionView.register(UINib(nibName: "TagCollectionCell", bundle: nil),
                                forCellWithReuseIdentifier: tagCellReuseId)
        
        configureLayout()
    }
    
    private func configureLayout() {
        collectionView.register(UINib(nibName: "MainTitleHeader", bundle: nil),
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: mainTitleHeaderReuseId)
        collectionView.collectionViewLayout = createLayout()
    }
    
    
    private func createLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { [weak self] (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            switch sectionIndex {
            case 0: return self?.createRoomsLayout()
            case 1: return self?.defaultLayout()
            case 2: return self?.createTagsLayout()
            default: return self?.defaultLayout()
            }
        }
    }
    
    
    private func createRoomsLayout() -> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(121.0), heightDimension: .fractionalHeight(1.0)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 0.0, leading: 1.0, bottom: 0.0, trailing: 1.0)
        
        let visibleCount = 3
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9),
                                               heightDimension: .absolute(190.0)),
            subitem: item,
            count: visibleCount)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 10.0, leading: 0.0, bottom: 10.0, trailing: 0.0)
        
        
        section.boundarySupplementaryItems = createSectionSupplementaryItems()
        return section
    }
    
    private func defaultLayout() -> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 4.0, leading: 4.0, bottom: 4.0, trailing: 4.0)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9),  heightDimension: .fractionalHeight(0.3))//.estimated(70))
        //let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 5)
        let section = NSCollectionLayoutSection(group: group)
        
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0.0, bottom: 10, trailing: 12)
        section.boundarySupplementaryItems = createSectionSupplementaryItems()
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
    
    private func createSectionSupplementaryItems() -> [NSCollectionLayoutBoundarySupplementaryItem] {
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                heightDimension: .absolute(44.0))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                        elementKind: UICollectionView.elementKindSectionHeader,
                                                                        alignment: .top)
        
        return [sectionHeader]
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
            return 32
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
        
        if let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                                      withReuseIdentifier: mainTitleHeaderReuseId,
                                                                      for: indexPath) as? MainTitleHeader {
            view.configure(title: "Пример[\(indexPath.section)]") {
                print("Header touched")
            }
            return view
        }
        return UICollectionReusableView()
    }
}
