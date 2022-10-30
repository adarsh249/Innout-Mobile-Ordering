//
//  ContentView.swift
//  InNOut Mobile Ordering
//
//  Created by Adarsh Patel on 9/8/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var menu = Menu()
    var body: some View {
        NavigationView{
            List{
                ForEach(menu.sections){section in
                    Section(header: Text(section.name)){
                        ForEach(section.items){item in
                            NavigationLink(destination: ItemDetail(item: item)){
                                ItemRow(item: item)
                                
                            }
                            
                        }
                    }
                }
            }
            .navigationTitle("Menu")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
