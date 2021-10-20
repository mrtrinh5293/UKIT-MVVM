//
//  ViewController.swift
//  praticeUIKITxx
//
//  Created by duc on 2021-10-16.
//

import UIKit

class CountriesViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    private var countryVM: CountryVIewModel!
    
    private var dataSourse: CountryTableViewDataSource<CountryTableViewCell, WorldData>!
    
    let searchController = UISearchController()
    var countryData = [WorldData]() {
        // didSet to execute code when a property has just been set to reload the table
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callToViewModelForUIUpdate()
        
        /// search element
        title = "World Countries"
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = true
        ///
    }
    
    func callToViewModelForUIUpdate() {
        self.countryVM = CountryVIewModel()
        self.countryVM.bindCountryViewModelToController = {
            self.updateDataSource()
        }
    }
    
    func updateDataSource() {
        self.dataSourse = CountryTableViewDataSource(cellIdentifier: "Cell",
                                                     items: self.countryVM.filteredTableData,
                                                     configureCell: { (cell, country) in
            cell.countryNameLabel.text = country.name
            cell.countryCityLabel.text = country.capital
        }, countryData: countryData)
        
        DispatchQueue.main.async {
            self.tableView.dataSource = self.dataSourse
            self.tableView.reloadData()
        }
    }
}

extension CountriesViewController: UISearchResultsUpdating {

    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        
        countryVM.search(text: text) {
            
        }
////
        tableView.reloadData()
    }
}

extension CountriesViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "ShowDetailSegue",
               let destination = segue.destination as? DetailsViewController,
               let cell = sender as? UITableViewCell,
               let indexPath = tableView.indexPath(for: cell) {
                let country = self.countryVM.filteredTableData[indexPath.row]
                destination.configure(with: country)            
            }
        }
}
