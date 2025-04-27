//
//  ContentView.swift
//  Invest_2
//
//  Created by user273384 on 4/13/25.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    
    // API vars
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @ObservedObject var stocksvm = InvestViewModel()
    
    // Auth vars
    let userID = Auth.auth().currentUser?.uid
    
    // Firestore vars
    @StateObject var investApp = AssetsViewModel()
    @State var investments = AssetsModel(num_owned: "", stock_ticker: "")
    
    var body: some View {
        NavigationStack {
            List {
                
                // Text("User: \(String(userID!))")
                HStack() {
                    Text("Stock")
                    Spacer()
                    Text("Shares ")
                }
                .fontWeight(.bold)
                ForEach($investApp.investments) { $investment in
                    NavigationLink {
                        //AssetDetailView(owned : investment.num_owned, symbol: investment.stock_ticker)
                        AssetDetailView(investments: investment)
                    } label: {
                        HStack() {
                            Text(investment.stock_ticker)
                            Spacer()
                            Text(investment.num_owned)
                        }
                    }
                }
                Section {
                    NavigationLink {
                        NewAssetView(investments: $investments)
                    } label: {
                        HStack() {
                            Text("Add New Asset")
                                .foregroundColor(Color.gray)
                                .font(.system(size: 15))
                            Spacer()
                            Text("")
                        }
                    }
                }
                Button {
                    Task {
                        viewModel.logout()
                    }
                } label: {
                    Text("Log Out")
                }
                //.padding([.top, .bottom], 50)
            }
            .onAppear {
                investApp.fetchData()
            }
            .refreshable {
                investApp.fetchData()
            }

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
