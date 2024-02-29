//
//  FruitTableViewCell.swift
//  Coding
//
//  Created by Lavinia Bertuzzi on 29/02/24.
//

import UIKit

class FruitTableViewCell: UITableViewCell {
    
    // MARK: - Outlets

    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
    }
    
    // MARK: - Public methods
    
    func configure(with text: String) -> UITableViewCell {
        titleLabel.text = text
        return self
    }
}
