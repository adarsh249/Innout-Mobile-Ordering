//
//  CheckoutView.swift
//  InNOut Mobile Ordering
//
//  Created by Adarsh Patel on 9/9/22.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    @State private var paymentType = "Cash"
   // @State private var addGiftCardNumber = false
    //@State private var giftCardNumber = ""
    let paymentTypes = ["Cash", "Card", "Gift Card"]
    let tipAmounts = [0, 10, 25, 20, 25] //add a custom
    @State private var tipAmount = 15
    var totalPrice: String{
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipAmount)
        
        return formatter.string(from: NSNumber(value: total + tipValue)) ?? "$0"
    }
    
    var body: some View {
        Form{
            Section{
                Picker("Choose a payment type", selection: $paymentType){
                    ForEach(paymentTypes, id: \.self){
                        Text($0)
                    }
                }
            }
            Section(header: Text("Add a tip?")){
                Picker("Percentage:", selection: $tipAmount){
                    ForEach(tipAmounts, id: \.self){
                        Text("\($0)")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())

            }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        
        Text("Total: \(totalPrice)")
            .bold()
        
        NavigationLink(destination: DestinationView()){
            Text("Confirm Order")
        }
        .buttonStyle(AddToOrderButtonStyle())

        
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
            .environmentObject(Order())
    }
}
