import Foundation

struct Party: Identifiable {
    let id = UUID()
    var name: String
    var bannerImageURL: URL
    var price: Double
    var startDate: Date
    var endDate: Date?
}

let partyNames = ["Club Poppin", "Poppin Thursdays", "Poppin Fridays", "Poppin Saturdays"]

let imageURLs = [
    URL(string: "https://images.pexels.com/photos/1190298/pexels-photo-1190298.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")!,
    URL(string: "https://images.pexels.com/photos/3171837/pexels-photo-3171837.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")!,
    URL(string: "https://upload.wikimedia.org/wikipedia/commons/3/32/Wikipedia_space_ibiza%2803%29.jpg")!,
    URL(string: "https://clubprana.com/wp-content/uploads/2023/08/The-Night-Club-Club-Prana.jpg")!
]

func generateRandomParty() -> Party {
    let randomName = partyNames.randomElement()!
    let randomImageURL = imageURLs.randomElement()!
    let randomPrice = Double.random(in: 10...100)
    let randomStartDate = Date()
    let randomEndDate = Bool.random() ? Date().addingTimeInterval(86400 * Double.random(in: 1...5)) : nil
    
    return Party(name: randomName, bannerImageURL: randomImageURL, price: randomPrice, startDate: randomStartDate, endDate: randomEndDate)
}
