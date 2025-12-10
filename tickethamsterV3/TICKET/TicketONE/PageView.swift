//
//  PageView.swift
//  tickethamsterV3
//

import SwiftUI

struct PageView: View {
    
    @State var isPresented: Bool = false
    
    //VAR DEL MODAL
    @State var modal = false
    @State var modal2 = false
    @State var modal3 = false
    @State var modal4 = false
    @State var modal5 = false
    
    //ESTO CIERRA EL MODAL
    @Environment(\.presentationMode) var presentationMode
    
    let page: Page
    
    var body: some View {
        ZStack {
            // 🔥 Imagen del ticket desde imageUrl (URL remota o fallback local)
            ticketBackground
            
            // TYPE
            Text(page.tx1)
                .font(.system(size: 15))
                .padding(.bottom, 580)
                .foregroundColor(.white)
            
            Text("SEC                       ROW                      SEAT")
                .font(.system(size: 14))
                .padding(.bottom, 500)
                .foregroundColor(.white)
            
            // SEC
            Text(page.tx3).bold()
                .font(.system(size: 22))
                .padding(.bottom, 415)
                .padding(.trailing, 240)
                .foregroundColor(.white)
            
            // ROW
            Text(page.tx4).bold()
                .font(.system(size: 22))
                .padding(.bottom, 415)
                .foregroundColor(.white)
            
            // SEAT
            Text(page.tx5).bold()
                .font(.system(size: 22))
                .padding(.bottom, 415)
                .padding(.leading, 240)
                .foregroundColor(.white)
            
            // EVENT NAME
            Text(page.tx6)
                .font(.system(size: 20))
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .padding(.bottom, 20)
            
            // EVENT DATE
            Text(page.tx7)
                .font(.system(size: 12))
                .padding(.top, 60)
                .foregroundColor(.white)
            
            Text(page.tx8)
                .foregroundColor(.black)
                .font(.system(size: 15))
                .padding(.top, 200)
            
            // BUTTON TO CODE
            Button(action: { modal.toggle() }) {
                ZStack {
                    Rectangle()
                        .frame(width: 325, height: 50)
                        .foregroundColor(Color("nHead"))
                        .cornerRadius(1.0)
                    
                    HStack {
                        Image("scan")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25)
                            .padding(.trailing, 10)
                        Text("View Ticket")
                            .font(.system(size: 15))
                    }
                    .foregroundColor(.white)
                }
            }
            .fullScreenCover(isPresented: $modal) {
                CodeViewer(pages: [page])
            }
            .padding(.top, 350)

            HStack {
                //BUTTON TO DETAILS
                Button(action: { modal2.toggle() }) {
                    Text("Ticket Details")
                        .fontWeight(.medium)
                        .foregroundColor(Color("blueticket"))
                        .font(.custom("Lexend", size: 14))
                        .padding(13)
                        .cornerRadius(4)
                }
                .fullScreenCover(isPresented: $modal2) {
                    Details()
                }
                
            }
            .padding(.top, 510)
        }
    }
    
    // MARK: - Fondo del ticket usando imageUrl
    private var ticketBackground: some View {
        Group {
            if let url = URL(string: page.imageUrl), !page.imageUrl.isEmpty {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: 380, height: 651)
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 380, height: 651)
                    case .failure:
                        Image("ticket") // fallback local
                            .resizable()
                            .scaledToFit()
                            .frame(width: 380, height: 651)
                    @unknown default:
                        Image("ticket")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 380, height: 651)
                    }
                }
            } else {
                // Si no hay URL, usa asset local
                Image("ticket")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 380, height: 651)
            }
        }
    }
}

#Preview {
    PageView(page: Page.samplePage)
}
