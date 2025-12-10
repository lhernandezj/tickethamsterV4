//
//  ContentView.swift
//  tickethamsterV3
//
//  Created by Eduardo Wolffel on 17/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       
        ZStack{
            
            Color.orange
                .ignoresSafeArea()
            
            TabView{
                Discover()
                    .tabItem(){
                        
                        Image("discover")
                        Text("Discover")
                    }
                Favorites()
                    .tabItem(){
                        Image("favorites")
                        Text("Favorites")
                    }
                Events()
                    .tabItem(){
                        Image("events")
                        Text("My Events")
                    }
                Account()
                    .tabItem(){
                        Image("profile")
                        Text("My Account")
                        
                    }
            }
            
            //NAVBAR COLOR
            .onAppear(){
                UITabBar.appearance().backgroundColor = .white
            }
            //ICON COLOR
            .tint(.blue)
            
        }
        
    }

}

#Preview {
    ContentView()
}
