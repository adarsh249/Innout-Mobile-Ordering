//
//  InNOut_Mobile_OrderingApp.swift
//  InNOut Mobile Ordering
//
//  Created by Adarsh Patel on 9/8/22.
//

import SwiftUI

@main
struct InNOut_Mobile_OrderingApp: App {
    @StateObject var order = Order()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
