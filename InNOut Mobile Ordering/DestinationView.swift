//
//  DestinationView.swift
//  InNOut Mobile Ordering
//
//  Created by Adarsh Patel on 9/10/22.
//

import SwiftUI

struct DestinationView: View {
    @EnvironmentObject var order: Order
    var body: some View {
        VStack{
            Spacer()
            Text("Your order is being prepared!")
                .bold()
                .foregroundColor(.white)
                .font(.system(size: 30))
            HStack{
                Spacer()
                Image("In-N-Out-Burger-Symbol")
                    .resizable()
                    .scaledToFit()
                Spacer()
            }
            Spacer()
        }
        .background(Color(UIColor(named: "Logo Color")!).edgesIgnoringSafeArea(.all))
    }
}

struct DestinationView_Previews: PreviewProvider {
    static var previews: some View {
        DestinationView()
            .environmentObject(Order())
    }
}
