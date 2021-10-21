//
//  CountryTableViewCell.swift
//  praticeUIKITxx
//
//  Created by duc on 2021-10-20.
//

import Foundation
import UIKit

class CountryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var countryCityLabel: UILabel!
    
    var country: [WorldData]? {
        didSet {
            for i in country ?? [] {
                countryNameLabel.text = i.name
                countryCityLabel.text = i.capital
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }    
}
