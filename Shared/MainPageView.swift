//
//  MainPageView.swift
//  TestApp
//
//  Created by Ratmir Suleyev on 27.08.2022.
//

import SwiftUI
import FirebaseAuth

struct MainPageView: View {
    @EnvironmentObject var viewModel: AppViewModel
    var body: some View {
        TabView{
            VStack(){
                Text("firstpage")
                    .font(.largeTitle)
                
                Button {
                    viewModel.signOut()
                } label: {
                    Text("log out")
                        .frame(width: 60, height: 10)
                }

            }
            .tabItem {
                Image(systemName: "house")
            }
            VStack(){
                Text("secondpage")
                    .font(.largeTitle)


            }
            .tabItem {
                Image(systemName: "envelope")
            }
            VStack(){
                Text("thirdpage")
                    .font(.largeTitle)

                

            }
            .tabItem {
                Image(systemName: "cloud")
            }
            VStack(){
                Text("fourthpage")
                    .font(.largeTitle)


            }
            .tabItem {
                Image(systemName: "sun.max.fill")
            }
            VStack(){
                Text("profilepage")
                    .font(.largeTitle)


            }
            .tabItem {
                Image(systemName: "person")
            }
            
        }
 

    }
}

struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView()
    }
}
