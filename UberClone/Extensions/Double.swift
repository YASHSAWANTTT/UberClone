//
//  Double.swift
//  UberClone
//
//  Created by Yash Sawant  on 6/27/23.
//

import Foundation

extension Double {
    
    private var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    func toCurrency() -> String {
      //  self as NSNumber
        return currencyFormatter.string(for: self) ?? ""
        
    }
}
