//
//  ViewController.swift
//  RootApp
//
//  Created by Sarankumar on 04/11/19.
//  Copyright © 2019 Saran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    
    var countryListViewModel: CountryListViewModel? = CountryListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }

    func setupView() {
        self.collectionView.register(UINib(nibName: Constants.NibIdentifier.CardCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: Constants.CellIdentifier.CardCollectionViewCell)
        countryListViewModel?.getCountryList({ (isSucess) in
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        })
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.countryListViewModel!.countriesCount()
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard  let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CellIdentifier.CardCollectionViewCell, for: indexPath) as? CardCollectionViewCell, let countryList = self.countryListViewModel!.getCountryAtIndex(index: indexPath.row) else {
            return UICollectionViewCell()
        }
        cell.configureCell(countryList: countryList)
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width - 10
        return CGSize(width: collectionViewWidth/2, height: collectionViewWidth/2)
    }
}


