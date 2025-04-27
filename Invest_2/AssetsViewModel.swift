//
//  StockViewModel.swift
//  Invest_2
//
//  Created by user273384 on 4/23/25.
//

import Foundation
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
class AssetsViewModel : ObservableObject {
    
    @Published var investments = [AssetsModel]()
    let db = Firestore.firestore()
    
    // Auth vars
    let userID = Auth.auth().currentUser?.uid
    
    func fetchData() {
        self.investments.removeAll()
        db.collection("users").document(userID!).collection("investments")
            .getDocuments() { (querySnapShot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapShot!.documents {
                        do {
                            self.investments.append(try document.data(as: AssetsModel.self))
                        } catch {
                            print(error)
                        }
                    }
                }
            }
    }
    
    func addAsset(investment: AssetsModel) {
        if !investment.stock_ticker.isEmpty || !investment.num_owned.isEmpty {
            var ref: DocumentReference? = nil
            ref = db.collection("users").document(userID!).collection("investments").addDocument(data: [
                "stock_ticker": investment.stock_ticker.uppercased(),
                "num_owned": investment.num_owned
            ]) { err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    print("Investment added with ID: \(ref!.documentID)")
                }
            }
        }
    }
    
    func deleteAsset(id: String) {
        db.collection("users").document(userID!).collection("investments").document(id).delete() { error in
            if let error = error {
                print("Error: deleting asset documentID \(id)")
            } else {
                print("Successsfully deleted asset")
            }
        }
    }
}



func get_total(owned: String, price: Double) -> String {
    var positionStr = ""
    var position = (Double(owned) ?? 1) * price
    position = round(position * 100)/100.0
    print(position)
    positionStr = String(format: "%.2f", position)
    return positionStr
}
