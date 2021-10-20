//
//  DetailViewController.swift
//  praticeUIKITxx
//
//  Created by duc on 2021-10-18.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var countryName: UILabel!
    var country: WorldData!
    
    func configure(with country: WorldData) {
        self.country = country
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countryName.text = country.name
        self.view = view
    }
}

