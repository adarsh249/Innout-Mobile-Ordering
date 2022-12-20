//
//  DestinationView.swift
//  InNOut Mobile Ordering
//
//  Created by Adarsh Patel on 9/10/22.
//

import SwiftUI

struct DestinationView: View {
    @EnvironmentObject var order: Order
    @State private var trackerView: Bool = false
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
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.trackerView = true
            }
        }
        .navigationBarItems(leading: NavigationLink(destination: OrderTrackerView(), isActive: $trackerView){
            EmptyView()
        })
    }
}

struct DestinationView_Previews: PreviewProvider {
    static var previews: some View {
        DestinationView()
            .environmentObject(Order())
    }
}
