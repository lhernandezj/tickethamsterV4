//
//  ListView.swift
//  tickethamsterV3
//
//  Created by Eduardo Wolffel on 17/10/24.
//

import SwiftUI
import FirebaseFirestore

struct ListView: View {

    // FIRESTORE DATA
    @State private var events: [Event] = []
    @State private var isLoading = false
    @State private var errorMessage: String?

    // UI
    @State private var eventIndex = 0
    @State private var modal = false

    // FIRESTORE FETCH
    private func fetchDiscoverEvents() {
        isLoading = true
        errorMessage = nil

        let db = Firestore.firestore()

        db.collection("Event")
            .document("Discover")
            .collection("Eventos")
            .getDocuments { snapshot, error in

                isLoading = false

                if let error = error {
                    errorMessage = error.localizedDescription
                    return
                }

                guard let docs = snapshot?.documents else { return }

                let sortedDocs = docs.sorted {
                    (Int($0.documentID) ?? 0) < (Int($1.documentID) ?? 0)
                }

                events = sortedDocs.compactMap { doc in
                    let data = doc.data()

                    let nombre = data["Nombre"] as? String ?? ""
                    let lugar  = data["Lugar"] as? String ?? ""
                    let fecha  = data["Fecha"] as? String ?? ""
                    let url    = data["EventoUrl"] as? String ?? ""

                    guard !nombre.isEmpty else { return nil }

                    return Event(
                        id: doc.documentID,
                        tx1: lugar,
                        tx2: nombre,
                        img1: url,
                        fecha: fecha
                    )
                }
            }
    }

    var body: some View {
        ZStack {

            if isLoading {
                ProgressView()
            }

            if let errorMessage {
                Text("Error: \(errorMessage)")
                    .foregroundColor(.red)
                    .font(.caption)
            }

            TabView(selection: $eventIndex) {
                ForEach(Array(events.enumerated()), id: \.element.id) { index, event in

                    Button(action: {
                        modal.toggle()
                    }) {

                        ZStack(alignment: .leading) {

                            // IMAGE
                            AsyncImage(url: URL(string: event.img1)) { phase in
                                switch phase {
                                case .empty:
                                    Color.gray.opacity(0.2)
                                case .success(let image):
                                    image
                                        .resizable()
                                        .scaledToFill()
                                case .failure:
                                    Color.gray.opacity(0.2)
                                @unknown default:
                                    EmptyView()
                                }
                            }
                            .frame(height: 500)
                            .clipped()

                            // TEXT
                            VStack(alignment: .leading, spacing: 6) {
                                Text(event.tx1)
                                    .font(.system(size: 14))
                                    .foregroundStyle(.gray)

                                Text(event.tx2)
                                    .font(.system(size: 18, weight: .semibold))
                                    .foregroundColor(.black)

                                Text(event.fecha)
                                    .font(.system(size: 13))
                                    .foregroundStyle(.gray)
                            }
                            .padding(16)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 18))
                        .padding(.horizontal, 16)
                    }
                    .tag(index)
                    .buttonStyle(.plain)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .automatic))
        }
        .onAppear {
            fetchDiscoverEvents()
        }
        .fullScreenCover(isPresented: $modal) {
            ErrorEvent()
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    ListView()
}
