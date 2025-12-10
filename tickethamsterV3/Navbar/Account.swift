//
//  Account.swift
//  tickethamsterV3
//
//  Created by Eduardo Wolffel on 17/10/24.
//

import SwiftUI

struct Account: View {
    
    @State private var showGreeting = true
    @State private var toggle = true
    @State var isPresented: Bool = false
    
    //TOGGLE SYMBOLS
    @State var notifications = true
    
    
    var body: some View {
        
        ZStack{
            
            ZStack{
                Color("backgroundColor")
                
                
                NavigationStack{
                    
                    ZStack(){
                        
                        Rectangle()
                            .frame(width: 500, height: 180)
                            .foregroundColor(Color("nHead"))
                        
                        VStack(alignment: .leading){
                            
                            Text("Luis Eduardo")
                                .bold()
                                .font(.system(size: 22))
                                .foregroundStyle(.white)
                            Text("eduardowolffelagmail.com")
                                .font(.system(size: 14))
                                .padding(.top, -6)
                                .foregroundStyle(.white)
                                .opacity(0.5)
                            
                        }
                        .padding(.top, 80)
                        .padding(.trailing, 210)
                    }
                    

                    List(){
                     
                        Section(header: Text("Notifications")){
                            
                            NavigationLink(destination: Error()){
                                Image(systemName: "envelope")
                                Text("Notifications")
                            }
                            
                            Toggle(isOn: $notifications, label: {
                                
                                HStack{
                                    Image(systemName: "bell")
                                    Text("Receive notifications?")
                                }
                                    })
                            .toggleStyle(SwitchToggleStyle(tint: Color("blueticket")))
                            .foregroundColor(.black)
                            
                            Rectangle()
                                .frame(height: 0.5)
                                .foregroundColor(Color("softgray"))
                                .padding(.top, -10)
                            
                        }
                        .listRowSeparator(.hidden)
                        .headerProminence(.increased)
                        
                        
                        Section(header: Text("Location Settings")){
                            
                            
                            Button(action:{}){
                                HStack(){
                                Image(systemName: "mappin.and.ellipse")
                                Text("My Location")
                                
                                Group(){
                                    
                                    Text("Miguel Hidalg...")
                                        .padding(.leading, 100)
                                    Image(systemName: "rectangle.and.pencil.and.ellipsis")
                                    
                                    }
                                .foregroundStyle(.blue)
                                }
                            }
                            .foregroundColor(.black)
                            
                            Button(action:{}){
                            HStack(){
                                
                                    
                                    Image("country")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24)
                                    Text("My Country")
                                    
                                    Group(){
                                        
                                        Text("           México")
                                            .padding(.leading, 110)
                                        Image(systemName: "rectangle.and.pencil.and.ellipsis")
                                        
                                    }
                                    .foregroundStyle(.blue)
                                }
                            }
                            .foregroundColor(.black)
                            
                            
                            Toggle(isOn: $showGreeting, label: {
                                
                                HStack{
                                    Image(systemName: "location")
                                    Text("Location Based Content")
                                }
                                    })
                            .toggleStyle(SwitchToggleStyle(tint: Color("blueticket")))
                            .foregroundColor(.black)
                            
                            Rectangle()
                                .frame(height: 0.5)
                                .foregroundColor(Color("softgray"))
                                .padding(.top, -10)
                            
                        }
                        .listSectionSpacing(-15)
                        .listRowSeparator(.hidden)
                        .headerProminence(.increased)
                        
                        
                        Section(header: Text("Preferences")){
                            
                            NavigationLink(destination: Error()){
                                Image(systemName: "heart")
                                Text("My Favorites")
                            }
                            
                            NavigationLink(destination: Error()){
                                Image(systemName: "creditcard")
                                Text("Saved Payment Methods")
                            }
                            
                            NavigationLink(destination: Error()){
                                Image(systemName: "paintbrush")
                                Text("Change App Icon ")
                            }
                            
                            Rectangle()
                                .frame(height: 0.5)
                                .foregroundColor(Color("softgray"))
                                .padding(.top, -10)
                            
                        }
                        .listSectionSpacing(-15)
                        .listRowSeparator(.hidden)
                        .headerProminence(.increased)
                        
                        
                        Section(header: Text("Help & Guidance")){
                            
                            NavigationLink(destination: Error()){
                                Image(systemName: "questionmark.circle")
                                Text("Need Help?")
                            }
                            
                            NavigationLink(destination: Error()){
                                Image(systemName: "text.bubble")
                                Text("Give Us Feedback")
                            }
                            
                            NavigationLink(destination: Error()){
                                Image(systemName: "eye.square")
                                Text("Privacy")
                            }
                            
                            NavigationLink(destination: Error()){
                                Image(systemName: "doc.text")
                                Text("Legal")
                            }
                            
                            Rectangle()
                                .frame(height: 0.5)
                                .foregroundColor(Color("softgray"))
                                .padding(.top, -10)
                            
                        }
                        .listSectionSpacing(-15)
                        .listRowSeparator(.hidden)
                        .headerProminence(.increased)
                        
                        Section(){
                            
                            NavigationLink(destination: Error()){
                                Image(systemName: "arrow.down.forward.square")
                                Text("Sing Out")
                                
                            }
                            .foregroundColor(.red)
                        
                            
                        }
                        .listSectionSpacing(-25)
                        .listRowSeparator(.hidden)
                        .headerProminence(.increased)
                        
                        
     
                    }
                    
                    .environment(\.defaultMinListRowHeight, 55)
                    .listStyle(.grouped)
                    .scrollContentBackground(.hidden)
                    
                   
                    
                }
                //STARTS HEAD
                ZStack{
                    
                    Rectangle()
                        .frame(height: 150)
                        .foregroundColor(Color("nHead"))
                    
                    Text("My Account")
                        .fontWeight(.bold)
                        .foregroundStyle(Color.white)
                        .padding(.top, 70)
   
                }
                .padding(.bottom, 850)
                //ENDS HEAD
                
            }
        }
    }
}

#Preview {
    Account()
}
