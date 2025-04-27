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
    
    @State private var viewContentActive = false
    // var owned : String
    // var symbol: String
    
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
                    Text(investments.stock_ticker)
                }
                HStack() {
                    Text("Price:")
                    Spacer()
                    Text("$\(String(stock.close))")
                }
                HStack() {
                    Text("Number Owned:")
                    Spacer()
                    Text(investments.num_owned)
                }
                HStack() {
                    Text("Position:")
                    Spacer()
                    Text("$\(get_total(owned: investments.num_owned, price: stock.close))")
                }
            }
            NavigationView {
                NavigationLink(isActive: $viewContentActive) {
                    ContentView()
                } label: {
                    EmptyView()
                }
            }
            
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    investApp.deleteAsset(id: investments.id!)
                    investments.stock_ticker = ""
                    investments.num_owned = ""
                    viewContentActive = true
                } label: {
                    Text("Delete Asset")
                }
            }
        }
        .task {            
            await stocksvm.fetchStockData(symbol: investments.stock_ticker)
        }
    }
}



#Preview {
    AssetDetailView()
}
