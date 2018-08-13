//
//  CryptoDetailViewController.swift
//  Cryptocurrency
//
//  Created by Азат Шамсуллин on 01.05.2018.
//  Copyright © 2018 ZeydenApp. All rights reserved.
//

import UIKit

class CryptoDetailViewController: UIViewController {
    
    var output: CryptoDetailViewOutput?

    @IBOutlet weak var bgView: BgGradientView!
    @IBOutlet weak var tableView: UITableView!
    
    let kCryptoDetailTableCell = "CryptoDetailTableCell"
    
    var currency: Currency?
    
    let keysForCurrencyProperty: [String] = ["id", "name", "symbol", "rank", "priceUsd", "priceBtc", "volumeUsd24h", "marketCapUsd", "availableSupply", "totalSupply", "maxSupply", "percentChange1h", "percentChange24h", "percentChange7d", "lastUpdate"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let start = CGPoint(x: 0, y: 0)
        let end = CGPoint(x: 1, y: 1)
        let colors = [UIColor(hex: 0x5F627D).cgColor, UIColor(hex: 0x313347).cgColor]
        bgView.addGradientLayer(from: start, to: end, colors: colors)
        
        // UINavigationController
        // Make transparent naigationBar
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        // White title seems better
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
        self.output?.viewIsReady()
    }

    
    

}


extension CryptoDetailViewController: CryptoDetailViewInput {
    
    func setupInitialState() {
        if self.viewIfLoaded != nil {
            tableView.reloadData()
        }
    }
    
    
    func displayCurrencyData(_ newData: Currency) {
        currency = newData
        
        if self.viewIfLoaded != nil {
            tableView.reloadData()
        }
    }
    
}



extension CryptoDetailViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return keysForCurrencyProperty.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kCryptoDetailTableCell, for: indexPath)
        
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
        cell.textLabel?.textColor = .white
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 14)
        cell.detailTextLabel?.textColor = .white
        
        cell.textLabel?.text = keysForCurrencyProperty[indexPath.row]
        
        switch indexPath.row {
        case 0:
            cell.detailTextLabel?.text = currency?.id
        case 1:
            cell.detailTextLabel?.text = currency?.name
        case 2:
            cell.detailTextLabel?.text = currency?.symbol
        case 3:
            cell.detailTextLabel?.text = currency?.rank
        case 4:
            cell.detailTextLabel?.text = currency?.priceUsd
        case 5:
            cell.detailTextLabel?.text = currency?.priceBtc
        case 6:
            cell.detailTextLabel?.text = currency?.volumeUsd24h
        case 7:
            cell.detailTextLabel?.text = currency?.marketCapUsd
        case 8:
            cell.detailTextLabel?.text = currency?.availableSupply
        case 9:
            cell.detailTextLabel?.text = currency?.totalSupply
        case 10:
            cell.detailTextLabel?.text = currency?.maxSupply
        case 11:
            cell.detailTextLabel?.text = currency?.percentChange1h
        case 12:
            cell.detailTextLabel?.text = currency?.percentChange24h
        case 13:
            cell.detailTextLabel?.text = currency?.percentChange7d
        case 14:
            cell.detailTextLabel?.text = currency?.lastUpdate
        
        default:
            fatalError("CurrencyDetail: Number of properties in currency model has been changed.")
        }
        
        return cell
    }
    
}












