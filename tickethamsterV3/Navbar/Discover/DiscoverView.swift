//
//  DiscoverView.swift
//  tickethamsterV3
//
//  Created by Eduardo Wolffel on 17/10/24.
//

import SwiftUI

struct DiscoverView: View {

    var event: Event
    var onTap: (() -> Void)? = nil

    var body: some View {
        Button(action: {
            onTap?()
        }) {
            ZStack(alignment: .leading) {

                // IMAGE WITH FALLBACK
                if let url = URL(string: event.img1), !event.img1.isEmpty {
                    AsyncImage(url: url) { phase in
                        switch phase {
                        case .empty:
                            Image("discoverSample")
                                .resizable()
                                .scaledToFit()
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFit()
                        case .failure:
                            Image("discoverSample")
                                .resizable()
                                .scaledToFit()
                        @unknown default:
                            Image("discoverSample")
                                .resizable()
                                .scaledToFit()
                        }
                    }
                } else {
                    Image("discoverSample")
                        .resizable()
                        .scaledToFit()
                }

                // TEXTS (Lugar → Nombre)
                Text(event.tx1) // Lugar
                    .font(.system(size: 14))
                    .foregroundStyle(.gray)
                    .padding(.top, 270)
                    .padding(.leading, 15)

                Text(event.tx2) // Nombre
                    .font(.system(size: 18))
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .padding(.top, 325)
                    .padding(.leading, 15)
            }
            .frame(width: 400, height: 651)
            .clipped()
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    DiscoverView(
        event: Event(
            id: "1",
            tx1: "Teatro de los Insurgentes",
            tx2: "El Fantasma de la Ópera",
            img1: "",
            fecha: "" // ya no se usa
        )
    )
}
