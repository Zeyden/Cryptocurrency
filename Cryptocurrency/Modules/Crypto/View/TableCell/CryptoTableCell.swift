//
//  CryptoTableCell.swift
//  Cryptocurrency
//
//  Created by Азат Шамсуллин on 28.04.2018.
//  Copyright © 2018 ZeydenApp. All rights reserved.
//

import UIKit

class CryptoTableCell: UITableViewCell {
    static let kLargeHeight: CGFloat = 100
    static let kSmallHeight: CGFloat = 88

    @IBOutlet weak var symbolContainer: BgGradientView!
    @IBOutlet weak var symbolLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var priceBtcLbl: UILabel!
    @IBOutlet weak var priceUsdLbl: UILabel!
    @IBOutlet weak var change1hLbl: UILabel!
    @IBOutlet weak var changeImgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        preservesSuperviewLayoutMargins = false
        layoutMargins = .zero
        
        symbolContainer.clipsToBounds = true
        let start = CGPoint(x: 0, y: 0)
        let end = CGPoint(x: 1, y: 1)
        let colors = [UIColor(hex: 0x08AEEA).cgColor, UIColor(hex: 0x2AF598).cgColor]
        symbolContainer.addGradientLayer(from: start, to: end, colors: colors)
        
        symbolLbl.font = UIFont.systemFont(ofSize: UIScreen.main.bounds.height > 600 ? 15 : 13)
        nameLbl.font = UIFont.systemFont(ofSize: UIScreen.main.bounds.height > 600 ? 16 : 14, weight: .semibold)
        priceBtcLbl.font = UIFont.systemFont(ofSize: UIScreen.main.bounds.height > 600 ? 16 : 14)
        priceUsdLbl.font = UIFont.systemFont(ofSize: UIScreen.main.bounds.height > 600 ? 16 : 14, weight: .semibold)
        change1hLbl.font = UIFont.systemFont(ofSize: UIScreen.main.bounds.height > 600 ? 16 : 14)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        symbolContainer.layer.cornerRadius = (self.bounds.height - (20 + 20)/* top + bottom space */) / 2
    }

    
    func configue(currency: Currency) {
        symbolLbl.text = currency.symbol
        nameLbl.text = currency.name
        priceBtcLbl.text = currency.priceBtc != nil ? "\(currency.priceBtc!) BTC" : ""
        priceUsdLbl.text = currency.priceUsd != nil ? "$\(currency.priceUsd!)" : ""
        
        if let change = currency.percentChange1h, let dChange = Double(change) {
            change1hLbl.text = "\(abs(dChange))%"
            change1hLbl.textColor = dChange < 0 ? UIColor(hex: 0xEF455A) : UIColor(hex: 0x7ED321)
            changeImgView.image = dChange < 0 ? UIImage(named: "TriangleDown") : UIImage(named: "TriangleUp")
        }
        
        
        
    }
    
    
}
