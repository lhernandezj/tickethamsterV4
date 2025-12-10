//
//  CodeViewer.swift
//  tickethamsterV3
//
//  Created by Eduardo Jimenez on 21/10/24.
//

import SwiftUI

struct CodeViewer: View {
    
    @State var animation: Bool = false
    @State var animation2: Bool = false
    @State var code : Bool = false
    
    //ESTO CIERRA EL MODAL
    @Environment(\.presentationMode) var presentationMode
    
    var sum = 0
    @State private var codeIndex = 0
    private let codes: [Codee] = Codee.sampleCodes
    
    var body: some View {
        
        ZStack{
            
            Rectangle()
                .frame(width:440,height: 100)
                .padding(.top, 840)
                .foregroundColor(Color("nHead"))
            

            ZStack{
                TabView(selection: $codeIndex) {
                    ForEach(codes) { page in
                        
                        VStack{
                            Spacer()
                            CodeView(codee: page)
                                .padding(.bottom, 30)
                            
                            if page == codes.last {
                                
                                Button(action: goToZero){
                                HStack{
                                        Image(systemName: "chevron.left")
                                            .foregroundColor(Color.white)
                                            .font(.system(size: 20))

                                        Text("2 of 2")
                                            .foregroundColor(Color.white)
                                        
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(Color.white)
                                            .font(.system(size: 20))
                                            .opacity(0.5)
                                }
                                .padding(.bottom, 8)
     
                                }
                            } else {
                                ZStack{
                                    Button(action: incrementPage){
                                        HStack{
                                            
                                            Image(systemName: "chevron.left")
                                                .foregroundColor(Color.white)
                                                .font(.system(size: 20))
                                                .opacity(0.5)
                                            
                                            Text("1 of 2")
                                                .foregroundColor(Color.white)
                                            
                                            Image(systemName: "chevron.right")
                                                .foregroundColor(Color.white)
                                                .font(.system(size: 20))
                                        }
                                        .padding(.bottom, 8)
                                    }
                                }
                            }
                            
                        }
                        .tag(page.tag)
                    }
                    
                    
                }
                .animation(.easeInOut, value: codeIndex)
                .tabViewStyle(.page(indexDisplayMode: .never))
            
                //STARTS THE ANIMATION
                .onAppear(){
                    animation.toggle()
                }
                
                
                //SCAN ANIMATION
                /*if code == true {
                    Rectangle()
                        .frame(width: 12, height: 68)
                        .frame(maxWidth: 302, alignment: animation ? .trailing : .leading)
                        .foregroundColor(Color("blueticket"))
                        .opacity(0.6)
                        .padding(.bottom, 245)
                    //.animation(.spring())
                        .animation(Animation.linear(duration: 1.5).repeatForever(autoreverses: true).delay(0.13))
                        
                    
                    Rectangle()
                        .frame(width: 4, height: 90)
                        .frame(maxWidth: 295, alignment: animation ? .trailing : .leading)
                        .foregroundColor(Color("blueticket"))
                        .padding(.bottom, 245)
                    //.animation(.spring())
                        .animation(Animation.linear(duration: 1.5).repeatForever(autoreverses: true))
                }
                else
                {
                    Rectangle()
                        .frame(width: 12, height: 68)
                        .frame(maxWidth: 302, alignment: animation ? .trailing : .leading)
                        .foregroundColor(Color("blueticket"))
                        .opacity(0.6)
                        .padding(.bottom, 245)
                    //.animation(.spring())
                        .animation(Animation.linear(duration: 1.5).repeatForever(autoreverses: true).delay(0.13))
                        
                    
                    Rectangle()
                        .frame(width: 4, height: 90)
                        .frame(maxWidth: 295, alignment: animation ? .trailing : .leading)
                        .foregroundColor(Color("blueticket"))
                        .padding(.bottom, 245)
                    //.animation(.spring())
                        .animation(Animation.linear(duration: 1.5).repeatForever(autoreverses: true))
                }
                */
            }
        }
        
        
        //STARTS HEAD
        .overlay {
            ZStack{
                
                Button(action: {presentationMode.wrappedValue.dismiss()}){
                    
                    Color("nHead")
                        .frame(width: 600, height: 112)
                        .background(.ultraThinMaterial)
                        .blur(radius: 0.5)
                        .edgesIgnoringSafeArea(.top)
                }
                .frame(maxHeight: .infinity,alignment: .top)
                ZStack(alignment: .leading){
                    
                    
                    Image(systemName: "multiply")
                        .foregroundColor(Color.white)
                        .font(.system(size: 20))
                        .padding(.trailing, 350)
                        .padding(.top, 16)
                        /*.onAppear(){
                            animation.toggle()
                        }*/
                    
                    
                    Text("BAD BUNNY - DeBÍ TiRAR MáS FOToS WORLD TOUR")
                        .fontWeight(.medium)
                        .bold()
                        .font(.custom("Lexend", size: 15))
                        .foregroundColor(Color.white)
                        .padding(.leading, 35)
                    
                    Text("Wed 10 Dic 2025 • Estadio GNP Seguros")
                        .fontWeight(.medium)
                        .bold()
                        .font(.custom("Lexend", size: 12))
                        .foregroundColor(Color.white)
                        .padding(.top, 32)
                        .padding(.leading, 35)
                }
                .padding(.bottom, 825)
            }
        }
        .frame(maxHeight: .infinity,alignment: .top)
        //ENDS HEAD
    }
    
    func incrementPage() {
        codeIndex += 1
       
    }
    
    func goToZero () {
        codeIndex = 0
    }
    
    
    
}

#Preview {
    CodeViewer()
}
