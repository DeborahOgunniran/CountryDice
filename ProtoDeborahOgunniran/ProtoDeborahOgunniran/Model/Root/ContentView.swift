//
//  ContentView.swift
//  ProtoDeborahOgunniran
//
//  Created by Ogunniran Deborah on 22/02/2024.


import SwiftUI
import FirebaseCore

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthModel
   

    var body: some View {
        Group {
            if viewModel.userSession != nil {
                TabView {
                    HomeView() // home
                        .tabItem {
                            Image(systemName: "house.circle")
                            Text("Home")
                        }
                    CountryView() //shop
                        .tabItem {
                            Image(systemName: "globe.desk.fill")
                            Text("Shop")
                        }
                    LikedView(imageName: "mango", title: "Mango", price: 4.00, color: Color.green, selfIndex: 0) //shopItem
                        .tabItem {
                            Image(systemName: "heart.circle.fill")
                            Text("Items")
                        }
                    
                    CartView()
                        .tabItem {
                            Image(systemName: "cart")
                            Text("Cart")
                        }
                    PView() //profile
                        .tabItem {
                            Image(systemName: "person.crop.circle")
                            Text("Profile")
                        }
                }
            } else {
                LoginView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
