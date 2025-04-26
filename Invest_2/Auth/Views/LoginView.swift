//
//  LoginView.swift
//  Invest_2
//
//  Created by user273384 on 4/13/25.
//

import SwiftUI
import Combine
import FirebaseAnalytics


struct LoginView: View {
    
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @State var email = ""
    @State var password = ""
        
    var body: some View {
        NavigationView {
            VStack {
                Text("Login")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    Image(systemName: "at")
                    TextField("Email", text: $email)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                    
                }
                .padding(.vertical, 6)
                .background(Divider(), alignment: .bottom)
                .padding(.bottom, 4)
                
                HStack {
                    Image(systemName: "lock")
                    SecureField("Password", text: $password)
                        .submitLabel(.go)
                }
                .padding(.vertical, 6)
                .background(Divider(), alignment: .bottom)
                .padding(.bottom, 8)
                
                
                Button {
                    Task {
                        try await viewModel.login(withEmail: email, password: password)
                    }
                } label: {
                    Text("Login")
                }
                
                NavigationLink {
                    SignUpView()
                } label: {
                    Text("Don't have an account yet?")
                }
                
                
                .padding([.top, .bottom], 50)
                
            }
            .listStyle(.plain)
            .padding()
            //.analyticsScreen(name: "\(Self.self)")
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoginView()
            LoginView()
                .preferredColorScheme(.dark)
        }
        .environmentObject(AuthenticationViewModel())
    }
}

