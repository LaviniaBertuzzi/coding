//
//  CollectionViewController.swift
//  Coding
//
//  Created by Lavinia Bertuzzi on 29/02/24.
//

import Foundation
import UIKit

class CollectionViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    
    var cellsForLine = 3
    var cellsSpacing = 2.0
    var cellsLinesSpacing = 2.0
    var cellHeight = 185.0
    
    var cellWidth: CGFloat {
        return (self.view.frame.width / CGFloat(cellsForLine))
    }
    
    var cellSize: CGSize {
        
        let widthWithSpacing = cellWidth - cellsSpacing
        return CGSizeMake(widthWithSpacing, cellHeight)
    }
    
    // MARK: - ViewModel
    
    lazy var viewModel = ViewModel()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSetup()
    }
    
    // MARK: - Actions
    
    @IBAction func addFruitAction(_ sender: UIButton) {
        viewModel.counter += 1
        collectionView.reloadData()
    }
    
    // MARK: - Private methods
    
    func tableViewSetup() {
        collectionView.registerNib(FruitCollectionViewCell.self)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension CollectionViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.counter
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = viewModel.items[safe: indexPath.row] else {
            return UICollectionViewCell()
        }
        return collectionView.dequeue(FruitCollectionViewCell.self, for: indexPath).configure(with: item)
    }
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return cellsSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cellsLinesSpacing
    }
}
