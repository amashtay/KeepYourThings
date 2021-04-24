//
//  MainLayoutProvider.swift
//  Keep Your Things
//
//  Created by Александр on 25.04.2021.
//

import UIKit

final class MainLayoutProvider {
    
    func createLayout() -> UICollectionViewLayout {
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
        
        
        section.boundarySupplementaryItems = [createSectionHeader()]
        return section
    }
    
//    private func defaultLayout() -> NSCollectionLayoutSection {
//
//        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
//        item.contentInsets = NSDirectionalEdgeInsets(top: 4.0, leading: 4.0, bottom: 4.0, trailing: 4.0)
//        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9),  heightDimension: .fractionalHeight(0.3))
//        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 5)
//        let section = NSCollectionLayoutSection(group: group)
//
//        section.orthogonalScrollingBehavior = .groupPaging
//        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0.0, bottom: 10, trailing: 12)
//        section.boundarySupplementaryItems = createSectionSupplementaryItems()
//        return section
//    }
    
    private func defaultLayout() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        )
        item.contentInsets = NSDirectionalEdgeInsets(top: 10.0, leading: 20.0, bottom: 10.0, trailing: 20.0)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(105.0))
        let group  = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitem: item,
            count: 4
        )
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0.0, bottom: 10, trailing: 0.0)
        section.boundarySupplementaryItems = [createSectionHeader(), createSectionFooter()]
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
        section.contentInsets = NSDirectionalEdgeInsets(top: 36.0, leading: 20.0, bottom: 0.0, trailing: 20.0)
        return section
    }
    
    private func createSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                heightDimension: .absolute(44.0))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                        elementKind: UICollectionView.elementKindSectionHeader,
                                                                        alignment: .top)
        
        return sectionHeader
    }
    
    private func createSectionFooter() -> NSCollectionLayoutBoundarySupplementaryItem {
        let footerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                heightDimension: .absolute(1.0))
        let sectionFooter = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerSize,
                                                                        elementKind: UICollectionView.elementKindSectionFooter,
                                                                        alignment: .bottom)
        return sectionFooter
    }
    
}
