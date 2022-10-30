//
//  AddToOrderButtonStyle.swift
//  InNOut Mobile Ordering
//
//  Created by Adarsh Patel on 9/9/22.
//

import Foundation
import SwiftUI

struct AddToOrderButtonStyle: ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(.yellow)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}
