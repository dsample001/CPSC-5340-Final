//
//  AuthenticationViewModel.swift
//  Invest_2
//
//  Created by user273384 on 4/13/25.
//

import Foundation
import FirebaseAuth

@MainActor
class AuthenticationViewModel: ObservableObject {

    @Published var session : FirebaseAuth.User?
    
    init() {
        self.session = Auth.auth().currentUser
    }
    
    func login(withEmail: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: withEmail, password: password)
            self.session = result.user
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    func signup(withEmail: String, password: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: withEmail, password: password)
            self.session = result.user
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
            self.session = nil
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
}
