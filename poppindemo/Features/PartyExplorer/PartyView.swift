import SwiftUI

struct PartyCardView: View {
    
    var party: Party
    
    var body: some View {
        VStack {
            Spacer()
            VStack(alignment: .leading) {
                AsyncImage(url: party.bannerImageURL) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 220, height: 150)
                            .clipped()
                    } else {
                        ProgressView()
                            .frame(width: 220, height: 150)
                    }
                }
                Text(party.name)
                    .font(.headline)
                    .foregroundColor(.white)
                Text("$\(party.price, specifier: "%.2f")")
                    .font(.subheadline)
                    .foregroundColor(.white)
                Text("Start: \(party.startDate, style: .date)")
                    .font(.subheadline)
                    .foregroundColor(.white)
                if let endDate = party.endDate {
                    Text("End: \(endDate, style: .date)")
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
            }
            .padding()
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color.purple.opacity(0.8), Color.purple.opacity(0.6)]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
            .padding([.leading, .trailing])
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.clear)
    }
}
