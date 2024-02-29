//
//  CollectionExtension.swift
//  Coding
//
//  Created by Lavinia Bertuzzi on 29/02/24.
//

import Foundation

extension Collection {
    subscript (safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
