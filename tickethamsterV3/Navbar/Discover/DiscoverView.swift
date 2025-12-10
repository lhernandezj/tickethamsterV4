//
//  DiscoverView.swift
//  tickethamsterV3
//
//  Created by Eduardo Wolffel on 17/10/24.
//

import SwiftUI

struct DiscoverView: View {
  
        var event : Event
        var body: some View {
            
            ScrollView(showsIndicators: false) {
                
                Button (action: {}) {
            
                    ZStack(alignment: .leading){
              
                        Image("\(event.img1)")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 400, height: 651)
                    
                        Text(event.tx1)
                        .font(.system(size: 14))
                        .foregroundStyle(.gray)
                        .padding(.top, 270)
                        .padding(.leading, 15)
                    
                        Text(event.tx2)
                        .font(.system(size: 18))
                        .fontWeight(.semibold)
                        .padding(.top, 325)
                        .padding(.leading, 15)
                        .foregroundColor(.black)
                    
                    }
                }
                
                Button (action: {}) {
            
                    ZStack(alignment: .leading){
              
                        Image("\(event.img1)")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 400, height: 651)
                    
                        Text(event.tx1)
                        .font(.system(size: 14))
                        .foregroundStyle(.gray)
                        .padding(.top, 270)
                        .padding(.leading, 15)
                    
                        Text(event.tx2)
                        .font(.system(size: 18))
                        .fontWeight(.semibold)
                        .padding(.top, 325)
                        .padding(.leading, 15)
                        .foregroundColor(.black)
                    
                    }
                }
                .padding(.top, -330)
                
                Button (action: {}) {
            
                    ZStack(alignment: .leading){
              
                        Image("\(event.img1)")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 400, height: 651)
                    
                        Text(event.tx1)
                        .font(.system(size: 14))
                        .foregroundStyle(.gray)
                        .padding(.top, 270)
                        .padding(.leading, 15)
                    
                        Text(event.tx2)
                        .font(.system(size: 18))
                        .fontWeight(.semibold)
                        .padding(.top, 325)
                        .padding(.leading, 15)
                        .foregroundColor(.black)
                    
                    }
                }
                .padding(.top, -330)
                
                Button (action: {}) {
            
                    ZStack(alignment: .leading){
              
                        Image("\(event.img1)")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 400, height: 651)
                    
                        Text(event.tx1)
                        .font(.system(size: 14))
                        .foregroundStyle(.gray)
                        .padding(.top, 270)
                        .padding(.leading, 15)
                    
                        Text(event.tx2)
                        .font(.system(size: 18))
                        .fontWeight(.semibold)
                        .padding(.top, 325)
                        .padding(.leading, 15)
                        .foregroundColor(.black)
                    
                    }
                }
                .padding(.top, -330)
                
            }
        }
    }


#Preview {
    DiscoverView(event: Event.samplePage)
}

