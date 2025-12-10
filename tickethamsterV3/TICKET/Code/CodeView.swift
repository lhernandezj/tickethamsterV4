//
//  CodeView.swift
//  tickethamsterV3
//
//  Created by Eduardo Jimenez on 21/10/24.
//

import SwiftUI

struct CodeView: View {
    
    @State private var modal = false
    @State private var animation: Bool = false
    @State private var isPresented: Bool = false
    
    //ESTO CIERRA EL MODAL
    @Environment(\.presentationMode) var presentationMode
    
    // Ticket que viene de PageModel
    let page: Page
    
    var body: some View {
        
        ZStack {
            
            // 🔥 Fondo usando SafeIMG (safeUrl)
            safeBackground
            
            // Card blanca del código
            RoundedRectangle(cornerRadius: 15.0)
                .frame(width: 310, height: 138)
                .padding(.bottom, 178)
                .foregroundColor(Color.white)
                .onAppear {
                    animation.toggle()
                }
            
            // TYPE (tx1)
            Text(page.tx1)
                .padding(.bottom, 595)
                .foregroundColor(.white)
                .font(.system(size: 22))
            
            // Header SEC/ROW/SEAT
            Text("SEC                   ROW                  SEAT")
                .padding(.bottom, 512)
                .foregroundColor(.white)
                .font(.system(size: 14))
            
            // SEC (tx3)
            Text(page.tx3)
                .padding(.bottom, 440)
                .foregroundColor(.white)
                .font(.system(size: 22))
                .padding(.trailing, 200)
            
            // ROW (tx4)
            Text(page.tx4)
                .padding(.bottom, 440)
                .foregroundColor(.white)
                .font(.system(size: 22))
            
            // SEAT (tx5)
            Text(page.tx5)
                .padding(.bottom, 440)
                .foregroundColor(.white)
                .font(.system(size: 22))
                .padding(.leading, 200)
            
            // Código de barras (Barcode)
            barcodeImage
            
            Text("Boleto digital")
                .foregroundColor(.white)
                .font(.system(size: 16))
                .padding(.top, 25)

            Text("Screenshot's won't get you in.")
                .font(.system(size: 13))
                .padding(.bottom, 95)
                .foregroundColor(.black)
            
            Button(action: {}) {
                ZStack {
                    Rectangle()
                        .frame(width: 170, height: 45)
                        .foregroundColor(Color("blueticket"))
                        .cornerRadius(5.0)
                    
                    HStack {
                        Image(systemName: "checkmark.circle")
                            .font(.system(size: 22))
                        Text("View in Wallet")
                            .font(.system(size: 16))
                    }
                    .foregroundColor(.white)
                }
            }
            .padding(.top, 120)
        
            ZStack(alignment: .leading) {
                
                Text("ENTRANCE")
                    .foregroundColor(.white)
                    .font(.system(size: 18))
                    .padding(.top, 210)
                
                Text(page.acceso)   // 👈 viene de Firestore (campo Acceso)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.white)
                    .font(.system(size: 12))
                    .padding(.top, 255)
            }
            .padding(.trailing, 300)
            
            ZStack {
                
                Button(action: { isPresented = true }) {
                    Image(systemName: "arrow.clockwise").bold()
                        .foregroundColor(.black)
                        .font(.system(size: 20))
                        .padding(.leading, 250)
                        .padding(.bottom, 95)
                }
                .alert(isPresented: $isPresented, content: {
                    Alert(
                        title: Text("Error"),
                        message: Text("A network error has occurred, please try again later."),
                        dismissButton: .default(Text("Accept"), action: {
                            print("El user ha pulsado el botón de Aceptar")
                        })
                    )
                })
                
                Rectangle()
                    .frame(width: 12, height: 68)
                    .frame(maxWidth: 302, alignment: animation ? .trailing : .leading)
                    .foregroundColor(Color("blueticket"))
                    .opacity(0.6)
                    .padding(.bottom, 216)
                    .animation(
                        Animation.linear(duration: 1.5)
                            .repeatForever(autoreverses: true)
                            .delay(0.13),
                        value: animation
                    )
                
                Rectangle()
                    .frame(width: 4, height: 90)
                    .frame(maxWidth: 295, alignment: animation ? .trailing : .leading)
                    .foregroundColor(Color("blueticket"))
                    .padding(.bottom, 216)
                    .animation(
                        Animation.linear(duration: 1.5)
                            .repeatForever(autoreverses: true),
                        value: animation
                    )
            }
        }
    }
    
    // MARK: - Fondo SafeIMG
    private var safeBackground: some View {
        Group {
            if let url = URL(string: page.safeUrl), !page.safeUrl.isEmpty {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        Color.black.opacity(0.2)
                            .frame(width: 440, height: 774)
                    case .success(let image):
                        image
                            .resizable()
                            .frame(width: 440, height: 774)
                            .clipped()
                    case .failure:
                        Image("safe")
                            .resizable()
                            .frame(width: 440, height: 774)
                    @unknown default:
                        Image("safe")
                            .resizable()
                            .frame(width: 440, height: 774)
                    }
                }
            } else {
                Image("safe")
                    .resizable()
                    .frame(width: 440, height: 774)
            }
        }
    }
    
    // MARK: - Código de barras (Barcode)
    private var barcodeImage: some View {
        Group {
            if let url = URL(string: page.barcodeUrl), !page.barcodeUrl.isEmpty {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: 280, height: 68)
                            .padding(.bottom, 216)
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 280, height: 68)
                            .padding(.bottom, 216)
                    case .failure:
                        Image("barcode_placeholder")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 280, height: 68)
                            .padding(.bottom, 216)
                    @unknown default:
                        Image("barcode_placeholder")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 280, height: 68)
                            .padding(.bottom, 216)
                    }
                }
            } else {
                Image("barcode_placeholder")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 280, height: 68)
                    .padding(.bottom, 216)
            }
        }
    }
}

#Preview {
    CodeView(page: Page.samplePage)
}

