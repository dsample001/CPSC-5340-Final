//
//  InvestModel.swift
//  Invest_2
//
//  Created by user273384 on 4/23/25.
//

import Foundation
import FirebaseFirestore

struct InvestModel : Codable, Identifiable {
    @DocumentID var id: String?
    var assets : AssetModel
}



struct AssetModel : Codable, Identifiable {
    @DocumentID var id: String?
    var num_owned: Double
    var stock_name: String
}

