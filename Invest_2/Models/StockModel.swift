//
//  StockModel.swift
//  Invest_2
//
//  Created by user273384 on 4/22/25.
//

import Foundation

struct StockInfo : Codable, Identifiable {
    var id : UUID {
        return UUID()
    }
    let pagination : Pagination
    let data : [StockData]
}

struct Pagination : Codable, Identifiable {
    var id : UUID {
        return UUID()
    }
    let limit : Int?
    let offset : Int?
    let count : Int?
    let total : Int?
}

struct StockData : Codable, Identifiable {
    var id : UUID {
        return UUID()
    }
    let open : Double
    let high : Double
    let low : Double
    let close : Double
    let volume : Double
    let adj_high : Double
    let adj_low : Double
    let adj_close : Double
    let adj_open : Double
    let adj_volume : Double
    let split_factor : Double
    let dividend : Double
    let name : String
    let exchange_code : String
    let asset_type : String
    let price_currency : String
    let symbol : String
    let exchange : String
    let date : String    
}





