//
//  MenuSection.swift
//  InNOut Mobile Ordering
//
//  Created by Adarsh Patel on 9/9/22.
//

import Foundation

struct MenuSection: Identifiable, Codable {
    var id: UUID
    var name: String
    var items: [Item]
}
