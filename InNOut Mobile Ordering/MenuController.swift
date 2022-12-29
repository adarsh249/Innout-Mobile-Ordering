//
//  ContentView.swift
//  InNOut Mobile Ordering
//
//  Created by Adarsh Patel on 9/8/22.
//

/* SwiftUI Code
import SwiftUI
import UIKit

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
        }
    }
}
*/

import UIKit
import SwiftUI

class MenuController: UIViewController, UITableViewDataSource {
    @StateObject var menu = Menu()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return menu.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.sections[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! ItemRowViewTableCell
        
        let item = menu.sections[indexPath.section].items[indexPath.row]
        cell.configure(with: item)
        return cell
    }
}
