//
//
//  FruitCollectionViewCell.swift
//  Saint Laurent
//
//  Created by Lavinia Bertuzzi on 12/09/23.
//  Copyright © 2023 Saint Laurent. All rights reserved.
//
//

import UIKit

class FruitCollectionViewCell: UICollectionViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: - Public methods
    
    func configure(with text: String) -> UICollectionViewCell {
        titleLabel.text = text
        return self
    }
}
