//
//  Events.swift
//  tickethamsterV3
//
//  Created by Eduardo Wolffel on 17/10/24.
//

import SwiftUI

struct Events: View {
    
    @State var ticket1 = false
    @State var ticket2 = false
    @State var currentTab: Int = 0
    
    var body: some View {
        
        ZStack{
            Color("backgroundColor")
            
            ZStack(alignment: .top) {
                TabView(selection: self.$currentTab) {
                    EventsUp().tag(0)
                    EventsP().tag(1)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .edgesIgnoringSafeArea(.all)
                .padding(.top, 170)
                
                TabBarView(currentTab: self.$currentTab)
                
                
                
                
                
                
                
                //STARTS HEAD
                ZStack{
                    
                    Rectangle()
                        .frame(height: 150)
                        .foregroundColor(Color("nHead"))
                    
                    Text("My Events")
                        .fontWeight(.bold)
                        .foregroundStyle(Color.white)
                        .padding(.top, 70)
                        .padding(.trailing, 25)
                    
                    Button(action: {}){
                        Image("country")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25)
                    }
                    .padding(.top, 70)
                    .padding(.leading, 110)
                    
                    Button(action: {}){
                        
                        Text("Help")
                            .fontWeight(.bold)
                            .foregroundStyle(Color.white)
                    }
                    .padding(.top, 70)
                    .padding(.leading, 350)
                    
                    
                }
                .padding(.bottom, 850)
                //ENDS HEAD
                
            }
            
            
        }
    }
    
    struct TabBarView: View {
        @Binding var currentTab: Int
        @Namespace var namespace
        
        var tabBarOptions: [String] = ["             UPCOMING (1)          ", "            PAST(0)             "]
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
                        Color.white
                            .frame(height: 4)
                            .matchedGeometryEffect(id: "underline",
                                                   in: namespace,
                                                   properties: .frame)
                    } else {
                        Color.clear.frame(height: 4)
                    }
                }
                .animation(.spring(), value: self.currentTab)
            }
            .buttonStyle(.plain)
        }
    }
}

#Preview {
    Events()
}
