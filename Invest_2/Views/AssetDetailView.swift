//
//  StockDetail.swift
//  Invest_2
//
//  Created by user273384 on 4/26/25.
//

import SwiftUI

struct AssetDetailView: View {
    
    // API vars
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @ObservedObject var stocksvm = InvestViewModel()
    
    // Firestor vars
    @StateObject var investApp = AssetsViewModel()
    @State var investments = AssetsModel(num_owned: "", stock_ticker: "")
    
    var owned : String
    var symbol: String
    
    var body: some View {
        
        List {
            ForEach(stocksvm.stockInfo) { stock in
                HStack() {
                    Text("Name:")
                    Spacer()
                    Text(stock.name)
                }
                HStack() {
                    Text("Ticker:")
                    Spacer()
                    Text(stock.symbol)
                }
                HStack() {
                    Text("Price:")
                    Spacer()
                    Text(String(stock.close))
                }
                HStack() {
                    Text("Number Owned:")
                    Spacer()
                    Text(owned)
                }
                HStack() {
                    Text("Position:")
                    Spacer()
                    Text(get_total(owned: owned, price: stock.close))
                }
            }

        }
        .task {
            await stocksvm.fetchStockData(symbol: symbol)
        }
    }
}



#Preview {
    AssetDetailView(owned: "20", symbol: "AAPL")
}
