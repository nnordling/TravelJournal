import SwiftUI
import SwiftData

struct TripsView: View {
    @Environment(\.modelContext) var context
    @Query var trips: [TripModel]

    var body: some View {
        NavigationStack {
            VStack {
                if trips.isEmpty {
                    emptyStateView
                } else {
                    tripsView
                }
            }
            .navigationTitle("Trips")
            .background(.primaryBackground)
            .toolbar {
                Button {
                    context.insert(TripModel(title: "London", coverImageIdentifier: "", startDate: Date(), endDate: Date(), longitude: 1, latitude: 1))
                } label: {
                    Image(systemName: "plus.circle")
                        .foregroundStyle(.primaryAccent)
                }
            }
        }
    }
}

private extension TripsView {
    var emptyStateView: some View {
        VStack(spacing: 4) {
            Text("No trips added")
                .font(.title2)
                .bold()
                .foregroundStyle(.primaryText)
            Text("Get started by adding a trip")
                .foregroundStyle(.secondaryText)
            Button {
                context.insert(TripModel(title: "London", coverImageIdentifier: "", startDate: Date(), endDate: Date().advanced(by: 345600), longitude: 1, latitude: 1))
            } label: {
                Label("New Trip", systemImage: "plus.circle")
                    .foregroundStyle(.primaryAccent)
            }
            .padding(.top, 20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .offset(y: -100)
        .background(.primaryBackground)
    }

    var tripsView: some View {
        GeometryReader { proxy in
            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(trips) { trip in
                        tripCardView(for: trip)
                            .frame(height: proxy.size.width * 0.75)
                    }
                    .transition(.scale)
                }
                .padding(.horizontal, 16)
            }
            .animation(.easeInOut, value: trips)
        }
    }

    func tripCardView(for trip: TripModel) -> some View {
        ZStack(alignment: .bottom) {
            Image(.background)
                .resizable()
                .clipShape(.rect(cornerRadius: 8))
                .shadow(color: .shadow, radius: 4, y: 2)
            VStack(alignment: .leading) {
                Group {
                    Text(trip.title)
                        .font(.headline)
                        .foregroundStyle(.primaryText)
                        .padding(.top, 8)
                    Text("\(dateWithoutTime(trip.startDate)) - \(dateWithoutTime(trip.endDate))")
                        .font(.subheadline)
                        .foregroundStyle(.secondaryText)
                        .padding(.bottom, 8)
                }
                .padding(.horizontal, 16)
            }
            .frame(maxWidth: .infinity, alignment: .bottomLeading)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(.primaryBackground)
            )
        }
        .frame(maxWidth: .infinity)
    }

    func dateWithoutTime(_ date: Date?) -> String {
        guard let date else {
            return ""
        }

        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        formatter.locale = .current

        return formatter.string(from: date)
    }
}

#Preview {
    NavigationStack {
        TripsView()
            .modelContainer(for: TripModel.self, inMemory: true)
    }
}

#Preview {
    NavigationStack {
        TripsView()
            .modelContainer(for: TripModel.self, inMemory: true)
            .colorScheme(.dark)
    }
}
