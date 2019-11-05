//
//  CountryListViewModel.swift
//  RootApp
//
//  Created by Sarankumar on 04/11/19.
//  Copyright © 2019 Saran. All rights reserved.
//

import UIKit

class CountryListViewModel: NSObject {
    
    var countryMainList: [CountryList]? = []
    
    override init() {
        super.init()
    }

    func getCountryList(_ completionHandler: @escaping CompletionStatusHandler) {
        RootService.request(countriesURL, method: .get, headersType: .General, { (isSuccess, result, error) in
            DispatchQueue.main.async {
                if let list = result as? JSONArrayDictionary {
                    let country = CountryLists.Map(list)
                    self.countryMainList?.append(contentsOf: country?.countryList ?? [])
                }
                completionHandler(isSuccess)
            }
        })
    }
    
    func countriesCount() -> Int {
        return (self.countryMainList != nil ? self.countryMainList?.count ?? 0 : 0)
    }
    
    func getCountryAtIndex(index: Int) -> CountryList? {
        if index < self.countryMainList!.count {
            return self.countryMainList?[index]
        }
        return nil
    }

}
