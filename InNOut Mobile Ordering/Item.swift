//
//  Item.swift
//  InNOut Mobile Ordering
//
//  Created by Adarsh Patel on 9/9/22.
//

import Foundation

struct Item: Identifiable, Codable, Equatable{
    var id: UUID
    var name: String
    var price: Float
    var restrictions: [String]
    var description: String
    
    var thumbmailImage: String {
        name.replacingOccurrences(of: " ", with: "-")
    }
    
    var mainImage: String {
        "\(thumbmailImage)-Detail"
    }
    
    static let example = Item(id: UUID(), name: "Sample Item", price: 3.33, restrictions: ["G"], description: "Sample description")
}
