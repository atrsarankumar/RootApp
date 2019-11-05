//
//  CountryList.swift
//  RootApp
//
//  Created by Sarankumar on 04/11/19.
//  Copyright © 2019 Saran. All rights reserved.
//

import UIKit

struct CountryLists {
    var countryList: [CountryList] = []
}


extension CountryLists: Mappable {
    
    static func empty() -> CountryLists {
        return CountryLists(countryList: [])
    }
    
    static func Map(_ json: JSONObject) -> CountryLists? {
        guard let d: JSONArray = Parse(json) else {
            return nil
        }
        var countryList: [CountryList] = []
        for country in d {
            countryList.append(CountryList.Map(country) ?? CountryList.empty())
        }
        return CountryLists(countryList: countryList)
    }
}


struct CountryList {
    var flag: String
    var region: String
    var subregion: String
    var name: String
    var population: Int
    var cioc: String
}

extension CountryList: Mappable {
    
    static func empty() -> CountryList {
        return CountryList(flag: EMPTY_STRING, region: EMPTY_STRING, subregion: EMPTY_STRING, name: EMPTY_STRING, population: EMPTY_VALUE, cioc: EMPTY_STRING)
    }
    
    static func Map(_ json: JSONObject) -> CountryList? {
        guard let d: JSONDictionary = Parse(json) else {
            return nil
        }
        
        let flag = (d <-  "flag") ?? EMPTY_STRING
        let region = (d <-  "region") ?? EMPTY_STRING
        let subregion = (d <-  "subregion") ?? EMPTY_STRING
        let name = (d <-  "name") ?? EMPTY_STRING
        let population = (d <-  "population") ?? EMPTY_VALUE
        let cioc = (d <-  "cioc") ?? EMPTY_STRING
        
        return CountryList(flag: flag, region: region, subregion: subregion, name: name, population: population, cioc: cioc)
    }
    
}
