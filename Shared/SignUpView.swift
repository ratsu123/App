//
//  SwiftUIView.swift
//  TestApp
//
//  Created by Ratmir Suleyev on 27.08.2022.
//

import SwiftUI
import FirebaseAuth

struct SignUpView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AppViewModel


    var body: some View {
        ZStack{
            Color.cyan.ignoresSafeArea(.all)
            VStack(spacing:20){
                Spacer()
                Text("1FIT")
                    .foregroundColor(.white)
                    .font(.system(size: 57, weight: .bold))
                VStack {
                    ZStack{
                        RoundedRectangle(cornerRadius: 20 )
                            .padding()
                            .foregroundColor(.white)
                            .frame( height: 350)
                        VStack{
                            VStack {
                                Text("Регистрация")
                                    .font(.system(size: 40, weight: .bold))
                                    .padding(.bottom, 30)
                            }
                                
                                
                            TextField("Email", text: $email)
                                .disableAutocorrection(true)
                                .autocapitalization(.none)
                                .keyboardType(.emailAddress)
                                .padding()
                                .background(Color(.secondarySystemBackground))
                                .cornerRadius(15)
                            SecureField("password", text: $password)
                                .disableAutocorrection(true)
                                .autocapitalization(.none)
                                .padding()
                                .background(Color(.secondarySystemBackground))
                                .cornerRadius(15)
                            Button(action: {
                                guard !email.isEmpty, !password.isEmpty else{
                                    return
                                }
                                viewModel.signUp(email: email, password: password)
                            }){
                                Text("Создать аккаунт")
                                    .font(.system(size: 20, weight: .bold))
                                    .frame(width: 200, height: 50, alignment: .center)
                                    .background(Color(.blue))
                                    .cornerRadius(10)
                                    .foregroundColor(.white)
                                    
                            }.padding()
                            
                        
                            
                        }.padding()
                        
                        
                    }
                }
                                    
                    Spacer(minLength: 120)
            }
        
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
