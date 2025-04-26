//
//  InvestModel.swift
//  Invest_2
//
//  Created by user273384 on 4/23/25.
//

import Foundation
import FirebaseFirestore

struct AssetsModel : Codable, Identifiable {
    @DocumentID var id: String?
    var num_owned: String
    var stock_ticker: String
}

