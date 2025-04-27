//
//  NewAssetView.swift
//  Invest_2
//
//  Created by user273384 on 4/26/25.
//

import SwiftUI

struct NewAssetView: View {
    
    @Binding var investments : AssetsModel
    @StateObject var investApp = AssetsViewModel()
    
    @State private var viewContentActive = false
    
    var body: some View {
        List {
            HStack() {
                Text("Stock Symbol")
                Spacer()
                Divider()
                Spacer()
                TextField("Stock", text: $investments.stock_ticker)
                    .background(.yellow)
            }
            HStack() {
                Text("Number Owned: ")
                Spacer()
                Divider()
                Spacer()
                TextField("# Shares", text: $investments.num_owned)
                    .background(.yellow)
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
                    investApp.addAsset(investment: investments)
                    investments.stock_ticker = ""
                    investments.num_owned = ""
                    viewContentActive = true
                    
                } label: {
                    Text("Add")
                }
            }
        }
    }
}

#Preview {
    NewAssetView(investments: .constant(AssetsModel(num_owned: "1", stock_ticker: "Stock")))
}
