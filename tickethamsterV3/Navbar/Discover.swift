//
//  Discover.swift
//  tickethamsterV3
//
//  Created by Eduardo Wolffel on 17/10/24.
//

import SwiftUI
import FirebaseFirestore

struct Discover: View {

    // MARK: - Firestore data (Banner + Events)
    @State private var bannerUrl: String = ""
    @State private var bannerName: String = ""

    @State private var events: [Event] = []
    @State private var isLoadingEvents = false
    @State private var eventsError: String?

    // MARK: - Your existing UI state (unchanged)
    @State private var eventIndex = 0 // (no lo uso aquí, lo dejo para no romperte nada)
    @State var modal = false
    @State var modal2 = false

    @State private var SearchTerm = ""
    @State private var searchBar = "Search by Artist, Event or Venue"

    // MARK: - Firestore Fetch: Banner (Event/Discover/Eventos/Banner)
    private func fetchBanner() {
        Firestore.firestore()
            .collection("Event")
            .document("Discover")
            .collection("Eventos")
            .document("Banner")
            .getDocument { snap, error in

                if error != nil {
                    bannerUrl = ""
                    bannerName = ""
                    return
                }

                let data = snap?.data() ?? [:]
                bannerUrl = data["BannerUrl"] as? String ?? ""
                bannerName = data["Nombre"] as? String ?? ""
            }
    }

    // MARK: - Firestore Fetch: Events (Event/Discover/Eventos/{1,2,3...})
    private func fetchDiscoverEvents() {
        isLoadingEvents = true
        eventsError = nil

        Firestore.firestore()
            .collection("Event")
            .document("Discover")
            .collection("Eventos")
            .getDocuments { snapshot, error in

                isLoadingEvents = false

                if let error = error {
                    eventsError = error.localizedDescription
                    return
                }

                guard let docs = snapshot?.documents else { return }

                // Solo docs numéricos (1,2,3...) y ordenados
                let numericDocs = docs
                    .filter { Int($0.documentID) != nil } // <- ignora "Banner"
                    .sorted { (Int($0.documentID) ?? 0) < (Int($1.documentID) ?? 0) }

                events = numericDocs.compactMap { doc in
                    let data = doc.data()

                    let nombre = data["Nombre"] as? String ?? ""
                    let lugar  = data["Lugar"] as? String ?? ""
                    let url    = data["EventoUrl"] as? String ?? ""

                    guard !nombre.isEmpty else { return nil }

                    return Event(
                        id: doc.documentID,
                        tx1: lugar,
                        tx2: nombre,
                        img1: url,
                        fecha: "" // ya no lo usas, pero tu modelo lo tiene
                    )
                }
            }
    }

    var body: some View {
        ZStack {

            ScrollView(showsIndicators: false){

                // =========================
                // SEARCH BOX (NO TOCADO)
                // =========================
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

                        // FILTER HORIZONTAL LIST (NO TOCADO)
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

                // =========================
                // BANNER SECTION (DESDE BD + FALLBACK bannerSample)
                // =========================
                ZStack() {

                    if let url = URL(string: bannerUrl), !bannerUrl.isEmpty {
                        AsyncImage(url: url) { phase in
                            switch phase {
                            case .empty:
                                Image("bannerSample")
                                    .resizable()
                                    .scaledToFit()
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFit()
                            case .failure:
                                Image("bannerSample")
                                    .resizable()
                                    .scaledToFit()
                            @unknown default:
                                Image("bannerSample")
                                    .resizable()
                                    .scaledToFit()
                            }
                        }
                        .frame(width: 445)
                    } else {
                        Image("bannerSample")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 445)
                    }

                    ZStack(alignment: .leading){

                        Text(bannerName.isEmpty ? " " : bannerName)
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

                // =========================
                // EVENTS SECTION (DESDE BD)
                // =========================
                VStack(){

                    if isLoadingEvents {
                        ProgressView()
                            .padding(.top, 40)
                    }

                    if let eventsError {
                        Text("Error: \(eventsError)")
                            .font(.caption)
                            .foregroundColor(.red)
                            .padding(.top, 40)
                    }

                    ForEach(events) { event in
                        // Usa tu DiscoverView que ya tiene fallback "discoverSample"
                        DiscoverView(event: event) {
                            modal2.toggle()
                        }
                        .padding(.top, events.first?.id == event.id ? 0 : -330) // mantiene tu estilo de encimado
                    }
                    .fullScreenCover(isPresented: $modal2){
                        ErrorEvent()
                    }
                }
                .padding(.top, -180)
            }
            .padding(.top, 125)

            // =========================
            // HEAD (NO TOCADO)
            // =========================
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
        .onAppear {
            fetchBanner()
            fetchDiscoverEvents()
        }
    }
}

#Preview {
    Discover()
}
