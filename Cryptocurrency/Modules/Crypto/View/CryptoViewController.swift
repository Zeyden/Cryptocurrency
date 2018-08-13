//
//  CryptoViewController.swift
//  Cryptocurrency
//
//  Created by Азат Шамсуллин on 28.04.2018.
//  Copyright © 2018 ZeydenApp. All rights reserved.
//

import UIKit

class CryptoViewController: UIViewController {
    let kCryptoTableCellID = "CryptoTableCell"
    
    var output: CryptoViewOutput?
    
    @IBOutlet weak var bgView: BgGradientView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var numberOfCurrenciesLbl: UILabel!
    @IBOutlet weak var tableLoader: UIActivityIndicatorView!
    
    var refresh = UIRefreshControl()
    
    var data: [Currency]?
    var isLoadingData: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        refresh.tintColor = .black
        refresh.addTarget(self, action: #selector(didBeginRefreshing(_:)), for: .valueChanged)
        
        tableLoader.isHidden = true
        
        if #available(iOS 10, *) {
            tableView.refreshControl = refresh
        } else {
            tableView.addSubview(refresh)
        }
        
        // UINavigationController
        // Make transparent naigationBar
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        // White title seems better
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
        // BackgroundView
        // Make some gradient
        let start = CGPoint(x: 0, y: 0)
        let end = CGPoint(x: 1, y: 1)
        let colors = [UIColor(hex: 0x5F627D).cgColor, UIColor(hex: 0x313347).cgColor]
        bgView.addGradientLayer(from: start, to: end, colors: colors)

        self.output?.viewIsReady()
    }
    
    
    @objc func didBeginRefreshing(_ sender: UIRefreshControl) {
        isLoadingData = true
        self.output?.didBeginViewUpdating()
    }
    
}


extension CryptoViewController: CryptoViewInput {
    
    func setupInitialState() {
        data = nil
        
        refresh.beginRefreshing()
        didBeginRefreshing(refresh)
    }
    
    
    func displayCurrenciesData(_ newData: [Currency]) {
        isLoadingData = false
        
        data = newData
        
        if viewIfLoaded != nil {
            tableView.reloadData()
        }
    }
    
    
    func displayCurrenciesDataByAppending(_ newData: [Currency]) {
        isLoadingData = false
        
        if data == nil {
            data = [Currency]()
        }
        
        self.data?.append(contentsOf: newData)
        
        if viewIfLoaded != nil {
            tableView.reloadData()
        }
    }
    
    
    func beginRefreshing() {
        if refresh.isRefreshing == false {
            refresh.beginRefreshing()
        }
    }
    
    
    func endRefreshing() {
        if refresh.isRefreshing == true {
            refresh.endRefreshing()
        }
    }
    
    
    func beginLoading() {
        tableLoader.isHidden = false
        if tableLoader.isAnimating == false {
            tableLoader.startAnimating()
        }
    }
    
    
    func endLoading() {
        if tableLoader.isAnimating == true {
            tableLoader.stopAnimating()
        }
        tableLoader.isHidden = true
    }
    
    
    func showNumberOfCurrencies() {
        numberOfCurrenciesLbl.text = "\(self.data?.count ?? 0) currencies"
        numberOfCurrenciesLbl.isHidden = false
    }
    
    
    func hideNumberOfCurrencies() {
        numberOfCurrenciesLbl.isHidden = true
    }
    
}


extension CryptoViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cryptoCell = tableView.dequeueReusableCell(withIdentifier: kCryptoTableCellID, for: indexPath) as! CryptoTableCell
        cryptoCell.configue(currency: data![indexPath.row])
        
        return cryptoCell
    }
    
}


extension CryptoViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height > 600 ? CryptoTableCell.kLargeHeight : CryptoTableCell.kSmallHeight
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastIndex = data!.count - 1
        
        if !isLoadingData && indexPath.row == lastIndex {
            isLoadingData = true
            self.output?.viewNeedsMoreData(self.data)
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        self.output?.didSelectCurrency(self.data![indexPath.row])
    }

    
}






















