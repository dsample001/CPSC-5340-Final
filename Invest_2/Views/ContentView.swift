//
//  ContentView.swift
//  Invest_2
//
//  Created by user273384 on 4/13/25.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @ObservedObject var stocksvm = InvestViewModel()
    let userID = Auth.auth().currentUser?.uid
    
    
    var body: some View {
        NavigationStack {
            List {

                Text("User Logged In!")
                Text("Ran before for loop")
                Text("User: \(String(userID!))")
                ForEach(stocksvm.stockInfo) { stock in
                    Text("Ran in for loop")
                    Text("Test: \(stock.name)")
                    Text("User: \(String(userID!))")
                }
                Button {
                    Task {
                        viewModel.logout()
                    }
                } label: {
                    Text("Log Out")
                }
                .padding([.top, .bottom], 50)
            }
            .task {
                await stocksvm.fetchStockData(symbol: "AAPL")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
