import SwiftUI

class Inventory : ObservableObject {
    @Published var loot = items
    
    func addItem(item: LootItem) {
        loot.append(item)
    }
}

struct ContentView: View {
    @StateObject var inventory = Inventory()
    
    @State var showAddItemView = false

    var body: some View {
        NavigationStack {
            List(inventory.loot, id: \.self) { item in
                NavigationLink {
                        LootDetailView(item: item) 
                    }
            label: {
                VStack(alignment: .leading) {
                   
                    HStack {
                        Circle()
                            .fill(item.rarity.getColor())
                            .frame(width: 12, height: 12)
                        Text(item.name).font(.headline)
                        Spacer()
                        Text(item.type.getLogo()) // Logo placé à droite
                        }
                    Text("Quantité : \(item.quantity)")
                }
            }
            }
                
            .sheet(isPresented: $showAddItemView, content: {
                AddItemView().environmentObject(inventory)
            })
            .navigationBarTitle("Loot")
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button(action: {
                        showAddItemView.toggle()
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                    })
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

