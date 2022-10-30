//
//  Order.swift
//  iDine
//
//  Created by Paul Hudson on 27/06/2019.
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import SwiftUI

class Order: ObservableObject {
    @Published var items = [Item]()

    var total: Double {
        if items.count > 0 {
            return Double(items.reduce(0) { $0 + $1.price })
        } else {
            return 0
        }
    }

    func add(item: Item) {
        items.append(item)
    }

    func remove(item: Item) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
    }
}
