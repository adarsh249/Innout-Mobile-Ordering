//
//  ItemRow.swift
//  InNOut Mobile Ordering
//
//  Created by Adarsh Patel on 9/9/22.
//
/* SwiftUI Code
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
*/

import UIKit

class ItemRowViewTableCell: UITableViewCell {
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    //add line for colors eventually
    
    func configure(with item: Item) {
        thumbnailImageView.image = UIImage(named: item.thumbmailImage)
        nameLabel.text = item.name
        priceLabel.text = "$\(item.price)"
        
        //add restriction code as well, later
    }
}
