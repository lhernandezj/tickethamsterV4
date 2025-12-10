//
//  Favorites.swift
//  tickethamsterV3
//
//  Created by Eduardo Wolffel on 17/10/24.
//

import SwiftUI

struct Favorites: View {
    
    @State var currentTab: Int = 0
    @State private var seleccion = 1
    @State private var searchText = ""
    
    var body: some View {
        
        
        ZStack{
            Color.white
            
            
            ZStack(alignment: .top) {
                TabView(selection: self.$currentTab) {
                    Performers().tag(0)
                    Teams().tag(1)
                    Venues().tag(2)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .edgesIgnoringSafeArea(.all)
                .padding(.top, 100)
                
                TabBarView(currentTab: self.$currentTab)
                
                
                
                //STARTS HEAD
                ZStack{
                    
                    Rectangle()
                        .frame(height: 150)
                        .foregroundColor(Color("nHead"))
                    
                    Text("Favorites")
                        .fontWeight(.bold)
                        .foregroundStyle(Color.white)
                        .padding(.top, 70)
                    
                    Button(action: {}){
                        
                        Text("Add+")
                            .fontWeight(.bold)
                            .foregroundStyle(Color.white)
                    }
                    .padding(.top, 70)
                    .padding(.leading, 330)
                    
                    
                }
                .padding(.bottom, 850)
                //ENDS HEAD
            }
            
        }
    }
}


struct TabBarView: View {
    @Binding var currentTab: Int
    @Namespace var namespace
    
    var tabBarOptions: [String] = ["Performers", "Teams", "Venues"]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(Array(zip(self.tabBarOptions.indices,
                                  self.tabBarOptions)),
                        id: \.0,
                        content: {
                    index, name in
                    TabBarItem(currentTab: self.$currentTab,
                               namespace: namespace.self,
                               tabBarItemName: name,
                               tab: index)
                    
                })
            }
            .padding(.horizontal)
        }
        .foregroundColor(Color.white)
        .background(Color("nHead"))
        .bold()
        .frame(height: 80)
        .padding(.top, 120)
    }
}

struct TabBarItem: View {
    @Binding var currentTab: Int
    let namespace: Namespace.ID
    
    var tabBarItemName: String
    var tab: Int
    
    var body: some View {
        Button {
            self.currentTab = tab
        } label: {
            VStack {
                Spacer()
                Text(tabBarItemName)
                if currentTab == tab {
                    Color("blueticket")
                        .frame(width: 120, height: 4)
                        .matchedGeometryEffect(id: "underline",
                                               in: namespace,
                                               properties: .frame)
                } else {
                    Color.clear.frame(width: 120, height: 4)
                }
            }
            .animation(.spring(), value: self.currentTab)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    Favorites()
}
