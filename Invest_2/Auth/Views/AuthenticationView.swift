//
//  AuthenticationView.swift
//  Invest_2
//
//  Created by user273384 on 4/13/25.
//

import SwiftUI
import Combine

struct AuthenticationView: View {
    
    @EnvironmentObject var viewModel: AuthenticationViewModel
    
    var body: some View {
        Group {
            if viewModel.session != nil {
                ContentView()
            } else {
                LoginView()
            }
        }
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
            .environmentObject(AuthenticationViewModel())
    }
}
