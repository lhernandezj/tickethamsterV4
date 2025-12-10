//
//  EventsP.swift
//  tickethamsterV3
//
//  Created by Eduardo Jimenez on 21/10/24.
//

import SwiftUI

struct EventsP: View {
    var body: some View {
        
        ScrollView(showsIndicators: false){
            
            
            ZStack{
                
                Circle()
                    .foregroundColor(Color("nHead"))
                    .frame(height: 100)
                
                Image("ticon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 230)
                
                Text("No past events")
                    .bold()
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color("nHead"))
                    .font(.system(size: 20))
                    .padding(.top, 200)
                
                Rectangle()
                    .frame(width: 350, height: 45)
                    .foregroundColor(Color.white)
                    .border(Color("nHead"))
                    .padding(.top, 450)
                
                Text("Refresh")
                    .bold()
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color("nHead"))
                    .font(.system(size: 16))
                    .padding(.top, 450)
                
            }
            
            
            
            
            ZStack{
                ZStack(alignment: .leading){
                    Image("edc")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 410, height: 230)
                    Text("Electric Daisy Carnival 2025 Individual Citibanamex Plus")
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color.white)
                        .font(.system(size: 20))
                        .padding(.leading, 20)
                        .padding(.top, 55)
                    Text("22 feb 2025, 3p.m. • Autódromo Hermanos Rodríguez")
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color.white)
                        .font(.system(size: 13))
                        .padding(.leading, 20)
                        .padding(.top, 130)
                    Image("ticon")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(.top, 175)
                        .padding(.leading, 20)
                    
                    Text("2 boletos")
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color.white)
                        .font(.system(size: 12))
                        .padding(.leading, 45)
                        .padding(.top, 175)
                    Rectangle()
                        .frame(width: 410, height: 223)
                        .foregroundColor(Color.white)
                        .opacity(0.6)
                        .padding(.bottom, 7)
                    Group()
                    {
                        Rectangle()
                            .frame(width: 396, height: 20)
                            .foregroundColor(Color("past"))
                            .padding(.bottom, 200)
                            .padding(.leading, 7)
                        Text("PAST EVENT").bold()
                            .foregroundColor(Color.white)
                            .font(.system(size: 12))
                            .padding(.bottom, 200)
                            .padding(.leading, 160)
                    }
                    .padding(.bottom, 50)
                }
            }
            .hidden()
            
            ZStack{
                ZStack(alignment: .leading){
                    Image("emblema")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 410, height: 230)
                    Text("Individual Tecate Emblema 2024 Citibanamex Plus")
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color.white)
                        .font(.system(size: 20))
                        .padding(.leading, 20)
                        .padding(.top, 55)
                    Text("sáb, may 18, 3 p.m. • Autódromo Hermanos Rodriguez")
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color.white)
                        .font(.system(size: 13))
                        .padding(.leading, 20)
                        .padding(.top, 130)
                    Image("ticon")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(.top, 175)
                        .padding(.leading, 20)
                    
                    Text("2 boletos")
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color.white)
                        .font(.system(size: 12))
                        .padding(.leading, 45)
                        .padding(.top, 175)
                    Rectangle()
                        .frame(width: 410, height: 223)
                        .foregroundColor(Color.white)
                        .opacity(0.6)
                        .padding(.bottom, 7)
                    Group()
                    {
                        Rectangle()
                            .frame(width: 396, height: 20)
                            .foregroundColor(Color("past"))
                            .padding(.bottom, 200)
                            .padding(.leading, 7)
                        Text("PAST EVENT").bold()
                            .foregroundColor(Color.white)
                            .font(.system(size: 12))
                            .padding(.bottom, 200)
                            .padding(.leading, 160)
                    }
                    .padding(.bottom, 50)
                }
            }
            .hidden()
            
            ZStack{
                ZStack(alignment: .leading){
                    Image("cm")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 410, height: 230)
                    Text("Individual General Axe Ceremonia 2024")
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color.white)
                        .font(.system(size: 20))
                        .padding(.leading, 20)
                        .padding(.top, 55)
                    Text("sáb, mar 23, 2 p.m. • Autódromo Hermanos Rodriguez")
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color.white)
                        .font(.system(size: 13))
                        .padding(.leading, 20)
                        .padding(.top, 130)
                    Image("ticon")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(.top, 175)
                        .padding(.leading, 20)
                    
                    Text("2 boletos")
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color.white)
                        .font(.system(size: 12))
                        .padding(.leading, 45)
                        .padding(.top, 175)
                    Rectangle()
                        .frame(width: 410, height: 223)
                        .foregroundColor(Color.white)
                        .opacity(0.6)
                        .padding(.bottom, 7)
                    Group()
                    {
                        Rectangle()
                            .frame(width: 396, height: 20)
                            .foregroundColor(Color("past"))
                            .padding(.bottom, 200)
                            .padding(.leading, 7)
                        Text("PAST EVENT").bold()
                            .foregroundColor(Color.white)
                            .font(.system(size: 12))
                            .padding(.bottom, 200)
                            .padding(.leading, 160)
                    }
                    .padding(.bottom, 50)
                }
            }
            .hidden()
            
            
            ZStack{
                ZStack(alignment: .leading){
                    Image("vl")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 410, height: 230)
                    Text("Individual General Vive Latino 2024")
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color.white)
                        .font(.system(size: 20))
                        .padding(.leading, 20)
                        .padding(.top, 75)
                    Text("sáb, mar 16, 1 p.m. • Autódromo Hermanos Rodriguez")
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color.white)
                        .font(.system(size: 13))
                        .padding(.leading, 20)
                        .padding(.top, 130)
                    Image("ticon")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(.top, 175)
                        .padding(.leading, 20)
                    
                    Text("2 boletos")
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color.white)
                        .font(.system(size: 12))
                        .padding(.leading, 45)
                        .padding(.top, 175)
                    Rectangle()
                        .frame(width: 400, height: 220)
                        .foregroundColor(Color.white)
                        .opacity(0.6)
                    Rectangle()
                        .frame(width: 400, height: 25)
                        .foregroundColor(Color("pastEvent"))
                        .padding(.bottom, 200)
                    Text("PAST EVENT").bold()
                        .foregroundColor(Color.white)
                        .font(.system(size: 12))
                        .padding(.bottom, 200)
                        .padding(.leading, 160)
                }
            }
            .hidden()

            
        }
        .padding(.top, 50)
    }
}


#Preview {
    EventsP()
}
