//
//  HomeView.swift
//  ProtoDeborahOgunniran
//
//  Created by Ogunniran Deborah on 24/02/2024.
// home

import SwiftUI


struct HomeView: View {
    @State var changeScreen = false
    var body: some View {
        NavigationStack {
            VStack(spacing: 50) {
                Image("plane")
                    .resizable()
                    .frame(maxHeight: 200)
                Text("We deliver grocery at your doorstep")
                
                    .font(.system(size: 42, weight: .bold, design: .rounded))
                    .multilineTextAlignment(.center)
                
                Text("Your ultimate shopping companion, our grocery app brings convenience to your fingertips. Browse, shop, and organize your essentials effortlessly, with personalized recommendations and easy checkout. Simplify your grocery experience today")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                
                Button() {
                    changeScreen = true
                    
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 50)
                        Text("Get Started")
                            .foregroundColor(.white)
                            .bold()
                    }
                } .frame(width: 200, height: 70)
                    .foregroundColor(.green)
            }
            .navigationDestination(isPresented: $changeScreen) {
                CountryView()
            }
        }
    }
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
        }
    }
}
