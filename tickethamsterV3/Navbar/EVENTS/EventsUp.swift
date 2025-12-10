//
//  EventsUp.swift
//  tickethamsterV3
//
//  Created by Eduardo Jimenez on 21/10/24.
//

import SwiftUI

struct EventsUp: View {

    @State private var ticket1 = false
    @State private var ticket2 = false

    @StateObject private var eventVM = EventViewModel()

    var body: some View {

        ScrollView(showsIndicators: false) {

            Button(action: {}) {
                ZStack {
                    Button(action: { ticket2.toggle() }) {

                        ZStack(alignment: .leading) {

                            // MARK: - IMAGEN DESDE FIREBASE O FALLBACK "event2"
                            if let urlString = eventVM.event?.eventIMG,
                               let url = URL(string: urlString),
                               !urlString.isEmpty {

                                AsyncImage(url: url) { phase in
                                    switch phase {
                                    case .empty:
                                        // mientras carga
                                        ProgressView()
                                            .frame(width: 420, height: 398)
                                            .padding()

                                    case .success(let image):
                                        image
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 420, height: 398)
                                            .padding()

                                    case .failure:
                                        // si falla la URL → imagen default
                                        Image("event2")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 420, height: 398)
                                            .padding()

                                    @unknown default:
                                        Image("event2")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 420, height: 398)
                                            .padding()
                                    }
                                }

                            } else {
                                // si no hay campo eventIMG → imagen default
                                Image("event2")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 420, height: 398)
                                    .padding()
                            }

                            // MARK: - FECHA
                            Text(eventVM.event?.fecha ?? "CARGANDO FECHA…")
                                .bold()
                                .foregroundColor(.white)
                                .font(.system(size: 15))
                                .multilineTextAlignment(.leading)
                                .frame(maxWidth: 340, alignment: .leading)
                                .padding(.leading, 35)
                                .padding(.top, 60)

                            // MARK: - NOMBRE DEL EVENTO
                            Text(eventVM.event?.nombre ?? "CARGANDO NOMBRE…")
                                .bold()
                                .foregroundColor(.white)
                                .font(.system(size: 28))
                                .multilineTextAlignment(.leading)
                                .frame(maxWidth: 340, alignment: .leading)
                                .padding(.leading, 35)
                                .padding(.top, 180)

                            // Línea café
                            Rectangle()
                                .foregroundColor(.brown)
                                .frame(width: 340, height: 5)
                                .padding(.leading, 35)
                                .padding(.top, 280)

                            // MARK: - LUGAR
                            Text(eventVM.event?.lugar ?? "CARGANDO LUGAR…")
                                .foregroundColor(.white)
                                .font(.system(size: 14))
                                .multilineTextAlignment(.leading)
                                .frame(maxWidth: 340, alignment: .leading)
                                .padding(.leading, 35)
                                .padding(.top, 330)
                        }
                    }
                    .fullScreenCover(isPresented: $ticket2) {
                        TicketsView()
                    }
                    .padding(.top, 30)
                }
            }
        }
    }
}

#Preview {
    EventsUp()
}
