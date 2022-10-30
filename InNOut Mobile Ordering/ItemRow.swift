//
//  ItemRow.swift
//  InNOut Mobile Ordering
//
//  Created by Adarsh Patel on 9/9/22.
//

import SwiftUI

struct ItemRow: View {
    let item: Item
    let colors: [String: Color] = ["D": .blue, "V": .green]
    var body: some View {
        HStack{
            Image(item.thumbmailImage)
                .cornerRadius(20)
                //.overlay(Circle().stroke(Color.yellow, lineWidth: 2))
            Text(item.name)
                .font(.headline)
            Text("$\(item.price, specifier: "%.2f")")
            ForEach(item.restrictions, id: \.self){restriction in
                Text(restriction)
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(5)
                    .background(colors[restriction, default: .black])
                    .clipShape(Circle())
                    .foregroundColor(.white)
        }        
        
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: Item.example)
    }
}
