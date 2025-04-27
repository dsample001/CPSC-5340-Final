//
//  InvestViewModel.swift
//  Invest_2
//
//  Created by user273384 on 4/22/25.
//

import Foundation

class InvestViewModel : ObservableObject {
    
    @Published private(set) var stockInfo = [StockData]()
    var key = "934372b8214e2689675c4cd79cd053a2"
    private var symbol = ""
    private var url = ""
    
    @MainActor
    func fetchStockData(symbol: String) async {
        // url = "https://api.marketstack.com/v2/eod/latest?access_key=934372b8214e2689675c4cd79cd053a2&symbols=AAPL"
        url = "https://api.marketstack.com/v2/eod/latest?access_key=\(key)&symbols=\(symbol)"
        print(symbol)
        print(url)
        if let url = URL(string: url) {
            do {
                print("Ran in fetch Data       ")
                let (data, response) = try await URLSession.shared.data(from: url)
                let resultsData = try JSONDecoder().decode(StockInfo.self, from: data)
                self.stockInfo = resultsData.data
                
            } catch {
                print("Something happended \(error)")
                print(error)
            }
        }
    }
    
}
