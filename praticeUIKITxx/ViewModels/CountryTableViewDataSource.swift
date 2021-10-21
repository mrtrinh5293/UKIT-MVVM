//
//  CountryTableViewDataSource.swift
//  praticeUIKITxx
//
//  Created by duc on 2021-10-20.
//

import Foundation
import UIKit

class CountryTableViewDataSource<CELL: UITableViewCell,T>: NSObject, UITableViewDataSource {
    private var cellIdentifier : String!
    private var items: [WorldData]!
    var configureCell: (CELL, WorldData) -> () = {_,_ in }
    let countryData: [WorldData]
    
    init(cellIdentifier: String, items: [WorldData], configureCell: @escaping (CELL, WorldData) -> (), countryData: [WorldData]) {
        self.cellIdentifier = cellIdentifier
        self.items = items
        self.configureCell = configureCell
        self.countryData = countryData
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CELL
        let item = self.items[indexPath.row]
        self.configureCell(cell, item)
        return cell
    }
}


