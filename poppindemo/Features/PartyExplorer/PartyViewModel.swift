import Combine

class PartyViewModel: ObservableObject {
    @Published var parties: [Party] = []
    @Published var searchQuery: String = ""
    
    init() {
        for _ in 0..<3 {
            parties.append(generateRandomParty())
        }
    }
    
    func addRandomParty() {
        parties.append(generateRandomParty())
    }
    
    var filteredParties: [Party] {
        if searchQuery.isEmpty {
            return parties
        } else {
            return parties.filter { $0.name.lowercased().contains(searchQuery.lowercased()) }
        }
    }
}
