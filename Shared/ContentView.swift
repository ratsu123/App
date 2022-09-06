//
//  ContentView.swift
//  Shared
//
//  Created by Ratmir Suleyev on 26.08.2022.
//

import SwiftUI
import FirebaseAuth

class AppViewModel: ObservableObject{
    let auth = Auth.auth()
    
    @Published var signedIn = false
    
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    func signIn(email: String, password: String){
        auth.signIn(withEmail: email, password: password) {[weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            DispatchQueue.main.async {
                self?.signedIn = true

            }
        }
    }
    func signUp(email: String, password: String){
        auth.createUser(withEmail: email, password: password) {[weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            DispatchQueue.main.async {
                self?.signedIn = true

            }
        }
    }
    func signOut() {
        try? auth.signOut()
        self.signedIn = false
    }
}

struct ContentView: View {
    @EnvironmentObject var viewModel: AppViewModel
    

    
    
    var body: some View {
        NavigationView{
            if viewModel.signedIn {
                MainPageView()
                   
            } else{
                SignInView()
                    
            }
        }
        .onAppear{
            viewModel.signedIn = viewModel.isSignedIn
        }
    
    }
}

struct SignInView: View {
    @EnvironmentObject var viewModel: AppViewModel
    @State private var email = ""
    @State private var password = ""
    
    

    
    
    var body: some View {
            ZStack{
                Color.cyan.ignoresSafeArea(.all)
                VStack(spacing:20){
                    Spacer(minLength: 50)
                    Text("1FIT")
                        .foregroundColor(.white)
                        .font(.system(size: 57, weight: .bold))
                    VStack {
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .padding()
                                .foregroundColor(.white)
                                .frame(height: 450)
                            VStack{
                                 Text("Авторизация")
                                    .font(.system(size: 40, weight: .bold))
                                    .padding(.bottom, 30)
                                    
                                VStack {
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
                                }.padding(.horizontal, 7)
                                
                                Button(action: {
                                    guard !email.isEmpty, !password.isEmpty else{
                                        return
                                    }
                                    viewModel.signIn(email: email, password: password)
                                }){
                                    Text("продолжить")
                                        .font(.system(size: 20, weight: .bold))
                                        .frame(width: 200, height: 50, alignment: .center)
                                        .background(Color(.blue))
                                        .cornerRadius(10)
                                        .foregroundColor(.white)
                                        
                                }.padding()
                                VStack {
                                    Text("У вас нет аккаунта?")
                                        .font(.system(size: 20))
                                        .padding(.bottom, 1)
                                    NavigationLink("зарегестрируйтесь", destination: SignUpView()).padding(.top,1)
                                }
                                
                            
                                
                            }.padding()
                            
                            
                        }
                    }
                                        
                        Spacer(minLength: 50)
                }
            
            }
                .navigationTitle("Авторизация")
                .navigationBarHidden(true)
    
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AppViewModel())
    }
}
