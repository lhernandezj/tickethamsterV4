import Foundation
import FirebaseFirestore

class TicketsViewModel: ObservableObject {
    @Published var pages: [Page] = []
    @Published var isLoading: Bool = true

    private let db = Firestore.firestore()
    private var listener: ListenerRegistration?

    private let eventCollection = "Event"
    private let eventDocID = "Evento"
    private let ticketsSubcollection = "Tickets"

    init() {
        listenToTickets()
    }

    func listenToTickets() {
        isLoading = true

        let ref = db.collection(eventCollection)
            .document(eventDocID)
            .collection(ticketsSubcollection)

        print("🎫 LISTEN -> \(eventCollection)/\(eventDocID)/\(ticketsSubcollection) (Order)")

        listener?.remove()
        listener = ref
            .order(by: "Order") // ✅ O mayúscula (como en tu BD)
            .addSnapshotListener { [weak self] snapshot, error in
                guard let self = self else { return }

                self.isLoading = false

                if let error = error {
                    print("❌ LISTENER error: \(error.localizedDescription)")
                    self.pages = []
                    return
                }

                guard let docs = snapshot?.documents else {
                    print("⚠️ snapshot nil / sin docs")
                    self.pages = []
                    return
                }

                print("✅ LISTENER docs count: \(docs.count)")

                var result: [Page] = []

                for (index, doc) in docs.enumerated() {
                    let data = doc.data()
                    print("📄 docID: '\(doc.documentID)'")

                    let type      = data["Type"] as? String ?? ""
                    let sec       = data["Sec"] as? String ?? ""
                    let row       = data["Row"] as? String ?? ""
                    let seat      = data["Seat"] as? String ?? ""
                    let name      = data["Name"] as? String ?? ""
                    let date      = data["Date"] as? String ?? ""

                    // ✅ En tu BD está como ImageUrl (no imageUrl)
                    let imageUrl  = data["ImageUrl"] as? String ?? ""

                    let barcode   = data["Barcode"] as? String ?? ""
                    let safeIMG   = data["SafeIMG"] as? String ?? ""
                    let acceso    = data["Acceso"] as? String ?? ""

                    let seatDetail    = data["SeatDetail"] as? String ?? ""
                    let barcodeNumber = data["BarcodeNumber"] as? String ?? ""
                    let place         = data["Place"] as? String ?? ""
                    let city          = data["City"] as? String ?? ""
                    let purchase      = data["Purchase"] as? String ?? ""
                    let price         = data["Price"] as? String ?? ""

                    let page = Page(
                        type: type,
                        sec: sec,
                        row: row,
                        seat: seat,
                        name: name,
                        date: date,
                        imageUrl: imageUrl,
                        barcodeUrl: barcode,
                        safeUrl: safeIMG,
                        acceso: acceso,
                        seatDetail: seatDetail,
                        barcodeNumber: barcodeNumber,
                        place: place,
                        city: city,
                        purchase: purchase,
                        price: price,
                        tag: index,
                        headerText: "SEC     ROW     SEAT"
                    )

                    result.append(page)
                }

                DispatchQueue.main.async {
                    self.pages = result
                    print("✅ pages actualizado: \(self.pages.count)")
                }
            }
    }

    deinit {
        listener?.remove()
    }
}
