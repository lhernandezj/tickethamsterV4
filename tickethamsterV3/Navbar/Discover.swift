//
//  Discover.swift
//  tickethamsterV3
//
//  Created by Eduardo Wolffel on 17/10/24.
//

import SwiftUI

struct Discover: View {
    
    @State private var eventIndex = 0
    private let events: [Event] = Event.samplePages
    
    @State var modal = false
    @State var modal2 = false
    
    @State private var SearchTerm = ""
    @State private var searchBar = "Search by Artist, Event or Venue"
    
    var body: some View {
        ZStack{

            ScrollView(showsIndicators: false){
  
              //SEARCH BOX
                ZStack{
                    Rectangle()
                        .frame(height: 235)
                        .foregroundColor(Color("nHead"))
                    
                    VStack{
                        
                        HStack{
                            
                            Button(action: {}){
                                
                                Image(systemName: "location")
                                    .foregroundColor(Color.blue)
                                
                                Text("Mexico City & M...")
                                    .multilineTextAlignment(.leading)
                                    .font(.custom("Lexend", size: 14))
                                    .foregroundColor(Color.white)
                                
                                Image(systemName: "chevron.down")
                                    .foregroundColor(Color.white)
                                
                            }
                            
                            Text("|")
                                .multilineTextAlignment(.leading)
                                .font(.custom("Lexend", size: 16))
                                .foregroundColor(Color.white)
                            
                            Button(action: {}){
                                
                                Image(systemName: "calendar")
                                    .foregroundColor(Color.blue)
                                
                                Text("All Dates                 ")
                                    .multilineTextAlignment(.leading)
                                    .font(.custom("Lexend", size: 14))
                                    .foregroundColor(Color.white)
                                
                                Image(systemName: "chevron.forward")
                                    .foregroundColor(Color.white)
                                
                            }
                            
                        }
                        .padding()
                        
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(width: 380, height: 0.7)
                        
                        HStack{
                            Spacer()
                            Spacer()
                            TextField("Search by Artist, Event or Venue", text: $searchBar)
                                .foregroundColor(Color.gray)
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(Color.blue)
                                .padding()
                            Spacer()
                        }
                        
                        .background(Color.white)
                        .frame(width: 380, height: 50)
                        .foregroundColor(Color.white)
                        .border(Color.white)
                        .cornerRadius(4)
                        .padding(.top)
                        
                        Text("Espacio")
                            .font(.custom("Lexend", size: 4))
                            .hidden()
                        
                        
                        //FILTER HORIZONTAL LIST
                        ScrollView(.horizontal, showsIndicators: false) {
                            
                            HStack {
                                
                                Button(action: {}) {
                                    Text("Music & Festivals")
                                        .foregroundColor(Color.white)
                                        .font(.custom("Lexend", size: 14))
                                        .padding(13)
                                        .border(Color.white)
                                        .cornerRadius(4)
                                }
                                .padding(.leading, 5)
                                
                                Button(action: {}) {
                                    Text("Arts & Theatre")
                                        .foregroundColor(Color.white)
                                        .font(.custom("Lexend", size: 14))
                                        .padding(13)
                                        .border(Color.white)
                                        .cornerRadius(4)
                                }
                                .padding(.leading, 5)
                                
                                Button(action: {}) {
                                    Text("Sports")
                                        .foregroundColor(Color.white)
                                        .font(.custom("Lexend", size: 14))
                                        .padding(13)
                                        .border(Color.white)
                                        .cornerRadius(4)
                                }
                                .padding(.leading, 5)
                                
                                Button(action: {}) {
                                    Text("Family")
                                        .foregroundColor(Color.white)
                                        .font(.custom("Lexend", size: 14))
                                        .padding(13)
                                        .border(Color.white)
                                        .cornerRadius(4)
                                }
                                .padding(.leading, 5)
                                
                                Button(action: {}) {
                                    Text("Specials")
                                        .foregroundColor(Color.white)
                                        .font(.custom("Lexend", size: 14))
                                        .padding(13)
                                        .border(Color.white)
                                        .cornerRadius(4)
                                }
                                .padding(.leading, 5)
                                
                                Button(action: {modal.toggle()}) {
                                    Text("Wolffel")
                                        .foregroundColor(Color.white)
                                        .font(.custom("Lexend", size: 14))
                                        .padding(13)
                                        .border(Color.white)
                                        .cornerRadius(4)
                                        .hidden()
                                }
                                .padding(.leading, 5)
                                .sheet(isPresented: $modal){
                                    About()
                                }
                                
                            }
                            .padding(.trailing, 10.0)
                            
                        }
                        .padding(.top, 15)
                        .padding(.leading,20)
                        
                    }
                    
                }
                
                //BANNER SECTION
                ZStack(){
                    Image("banner")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 445)
                    
                    ZStack(alignment: .leading){
                        
                        Text("El Rey León")
                            .fontWeight(.bold)
                            .font(.system(size: 25))
                                .foregroundColor(Color.white)
                                .padding(.top, 30)

                            
                            Button("Find Tickets"){
                           
                                modal2.toggle()
                                
                            }
                            .font(.custom("Lexend", size: 16).bold())
                            .frame(width: 150, height: 45)
                            .foregroundColor(Color.white)
                            .background(Color.blue)
                            .cornerRadius(6)
                            .hoverEffect()
                            .padding(.trailing, 200)
                            .padding(.top, 140)
                            .fullScreenCover(isPresented: $modal2){
                                ErrorEvent()
                            }
                    }
                }
                .padding(.top, -8)
                
                
                //EVENTS SECTION
                VStack(){
                    
                    //EVENT 1
                    Button (action: {modal2.toggle()}) {
                        
                        ZStack(alignment: .leading){
                            
                            Image("e1")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 415, height: 610)
                            
                            Text("Estadio GNP Seguros")
                                .font(.system(size: 14))
                                .foregroundStyle(.gray)
                                .padding(.top, 270)
                                .padding(.leading, 15)
                            
                            Text("Vive Latino 2026")
                                .font(.system(size: 18))
                                .fontWeight(.semibold)
                                .padding(.top, 325)
                                .padding(.leading, 15)
                                .foregroundColor(.black)
                            
                        }
                    }
                    .fullScreenCover(isPresented: $modal2){
                        ErrorEvent()
                    }
                    
                    //EVENT 2
                    Button (action: {modal2.toggle()}) {
                        
                        ZStack(alignment: .leading){
                            
                            Image("e2")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 415, height: 665)
                            
                            Text("Ticketmaster")
                                .font(.system(size: 14))
                                .foregroundStyle(.gray)
                                .padding(.top, 270)
                                .padding(.leading, 15)
                            
                            Text("Guía Estadio GNP Seguros")
                                .font(.system(size: 18))
                                .fontWeight(.semibold)
                                .padding(.top, 325)
                                .padding(.leading, 15)
                                .foregroundColor(.black)
                            
                        }
                    }
                    .padding(.top, -330)
                    .fullScreenCover(isPresented: $modal2){
                        ErrorEvent()
                    }
                    
                    //EVENT 3
                    Button (action: {modal2.toggle()}) {
                        
                        ZStack(alignment: .leading){
                            
                            Image("e3")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 415, height: 651)
                            
                            Text("Teatro de los Insurgentes")
                                .font(.system(size: 14))
                                .foregroundStyle(.gray)
                                .padding(.top, 270)
                                .padding(.leading, 15)
                            
                            Text("El Fantasma de la Ópera")
                                .font(.system(size: 18))
                                .fontWeight(.semibold)
                                .padding(.top, 325)
                                .padding(.leading, 15)
                                .foregroundColor(.black)
                            
                        }
                    }
                    .padding(.top, -330)
                    .fullScreenCover(isPresented: $modal2){
                        ErrorEvent()
                    }
                    
                    //EVENT 4
                    Button (action: {modal2.toggle()}) {
                        
                        ZStack(alignment: .leading){
                            
                            Image("e4")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 415, height: 651)
                            
                            Text("Ticketmaster")
                                .font(.system(size: 14))
                                .foregroundStyle(.gray)
                                .padding(.top, 270)
                                .padding(.leading, 15)
                            
                            Text("Heineken Garden Lounge")
                                .font(.system(size: 18))
                                .fontWeight(.semibold)
                                .padding(.top, 325)
                                .padding(.leading, 15)
                                .foregroundColor(.black)
                            
                        }
                    }
                    .padding(.top, -330)
                    .fullScreenCover(isPresented: $modal2){
                        ErrorEvent()
                    }
                }
                .padding(.top, -180)

            }
            .padding(.top, 125)
            
            //HEAD
            ZStack{
                
                Rectangle()
                    .frame(height: 150)
                    .foregroundColor(Color("nHead"))
                
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
                    .padding(.top, 70)
                
                Button(action: {}){
                    Image("country")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25)
                }
                    .padding(.top, 70)
                    .padding(.leading, 350)
                
                
            }
            .padding(.bottom, 850)
        }
        
        
        
    }
}

#Preview {
    Discover()
}
