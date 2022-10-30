//
//  ItemDetail.swift
//  InNOut Mobile Ordering
//
//  Created by Adarsh Patel on 9/9/22.
//

import SwiftUI

struct ItemDetail: View {
    @EnvironmentObject var order: Order
    let item: Item
    
    var body: some View {
        VStack{
            Image(item.mainImage)
                .resizable()
                .scaledToFit()
            Text(item.description)
                .padding()
            
            Button("Add to Order"){
                order.add(item: item)
            }
            .font(.headline)
            .buttonStyle(AddToOrderButtonStyle())
            
        }
        .navigationTitle(item.name)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetail(item: Item.example)
            .environmentObject(Order())
    }
}
