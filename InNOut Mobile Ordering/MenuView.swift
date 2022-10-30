//
//  MenuView.swift
//  InNOut Mobile Ordering
//
//  Created by Adarsh Patel on 9/9/22.
//

import SwiftUI

struct MenuView: View {
    @EnvironmentObject var menu: Menu
    
    var body: some View {
        NavigationView{
            ForEach(menu.sections){ section in
                Section{
                    ForEach(section.items){item in
                        VStack{
                            Text(item.name)
                        }
                    }
                }
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
