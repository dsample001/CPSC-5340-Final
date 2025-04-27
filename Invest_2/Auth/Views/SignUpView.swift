//
//  SignUpView.swift
//  Invest_2
//
//  Created by user273384 on 4/13/25.
//

import SwiftUI
import Combine
import FirebaseAnalytics


struct SignUpView: View {
    
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Register")
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
                        try await viewModel.signup(withEmail: email, password: password)
                    }
                } label: {
                    Text("Register")
                }
                
                NavigationLink {
                    LoginView()
                } label: {
                    Text("Already have an account?")
                }
                
                
                .padding([.top, .bottom], 50)
                
            }
            .listStyle(.plain)
            .padding()
        }
        //.analyticsScreen(name: "\(Self.self)")
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SignUpView()
            SignUpView()
                .preferredColorScheme(.dark)
        }
        .environmentObject(AuthenticationViewModel())
    }
}

