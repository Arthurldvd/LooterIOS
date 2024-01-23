import SwiftUI
import Charts


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
                ItemInfoView(item: item)
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
            Chart{
                ForEach(inventory.loot, id: \.self) { item in
                    BarMark(
                        x: .value("Arme",item.name),
                        y: .value("Force",item.attackStrength ?? 0)
                    )
                }
            }
            .frame(height:200)
          
        }
      
    }
    
}

#Preview {
    ContentView()
}

