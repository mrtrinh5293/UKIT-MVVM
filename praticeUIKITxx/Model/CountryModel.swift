//
//  CountryModel.swift
//  praticeUIKITxx
//
//  Created by duc on 2021-10-18.
//

import Foundation

struct Currency: Decodable, Encodable {
    let code, name, symbol: String?
}

struct Language: Decodable, Encodable {
    let name: String?
}

struct WorldData: Identifiable, Decodable, Encodable {
    var id: Int {
        return population
    }
    var name: String
    var numericCode: String?
    var alpha2Code: String?
    var capital: String?
    var region: String?
    var population: Int
    var area: Double?
    var altSpellings: [String]?
    var timezones: [String]?
    var latlng: [Double]?
    var currencies: [Currency]?
    var languages: [Language]
    var flag: String
    var callingCodes: [String]
    
}

struct Visiting: Identifiable {
    var id: UUID
    var isVisited: Bool
}

struct CountryLocation {
    let name: String
    var latlng: [Double] = []
}

