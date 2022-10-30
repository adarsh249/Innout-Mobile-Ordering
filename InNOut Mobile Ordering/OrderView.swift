//
//  OrderView.swift
//  InNOut Mobile Ordering
//
//  Created by Adarsh Patel on 9/9/22.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    var body: some View {
        NavigationView{
            List{
                Section{
                    ForEach(order.items){item in
                        HStack{
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price, specifier: "%.2f")")
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
                NavigationLink(destination: CheckoutView()){
                        Text("Place Order")
                    }
                    .buttonStyle(AddToOrderButtonStyle())
            }
            .navigationTitle("Order")
            .listStyle(InsetGroupedListStyle())
        }

    }
    func deleteItems(at offsets: IndexSet){
        order.items.remove(atOffsets: offsets)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
            .environmentObject(Order())
    }
}
