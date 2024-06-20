import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = PartyViewModel()
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    TextField("Search by name", text: $viewModel.searchQuery)
                        .padding(10)
                        .background(Color.gray.opacity(0.6))
                        .cornerRadius(14)
                        .padding()
                    Button(action: {
                        viewModel.addRandomParty()
                    }) {
                        Image(systemName: "plus")
                            .padding()
                            .background(Color.purple)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                    }
                    .padding()
                }
                
                List {
                    ForEach(viewModel.filteredParties) { party in
                        PartyCardView(party: party)
                            .padding(.vertical, 5)
                            .listRowBackground(Color.clear)
                    }
                }
                .listStyle(PlainListStyle())
                .background(Color.black)
            }
            .background(Color.black)
        }
    }
}
