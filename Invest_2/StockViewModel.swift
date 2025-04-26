//
//  StockViewModel.swift
//  Invest_2
//
//  Created by user273384 on 4/23/25.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

class StockViewModel : ObservableObject {
    
    @Published var investments = [InvestModel]()
    let db = Firestore.firestore()
    
    func fetchData() {
        self.investments.removeAll()
        db.collection("investments")
            .getDocuments() { (querySnapShot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapShot!.documents {
                        do {
                            self.investments.append(try document.data(as: InvestModel.self))
                        } catch {
                            print(error)
                        }
                    }
                }
            }
    }
}
