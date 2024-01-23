import SwiftUI

struct AddItemView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var inventory: Inventory
    @State var name: String = ""
    @State var rarity: Rarity = Rarity.common
    @State var quantity: Int = 1
    @State var game: Game = availableGames[0]
    @State var type: ItemType = .ring
    @State var attackItem: Bool = false
    @State var attackStrength: Int?

    @State private var showAlert = false
    @State private var alertMessage = ""

    var body: some View {
        Form {
            Section {
                TextField("Nom de l'objet", text: $name)
                Picker("Rareté", selection: $rarity) {
                    ForEach(Rarity.allCases, id: \.self) { rarity in
                        Text(String(describing: rarity).capitalized)
                    }
                }
            }
            
            Section {
                Picker("Jeu", selection: $game) {
                    ForEach(availableGames, id: \.self) { game in
                        Text(game.name.capitalized)
                            .tag(game)
                    }
                }
                
                Stepper(value: $quantity, in: 1...100) {
                    Text("Quantité : \(quantity)")
                }
            }
            
            Section {
                HStack {
                    Text("Type : ")
                    Spacer()
                    Text(type.getLogo())
                }
                Picker("Type", selection: $type) {
                    ForEach(ItemType.allCases, id: \.self) { selectedType in
                        Text(selectedType.getLogo())
                            .tag(selectedType)
                    }
                }
                .pickerStyle(PalettePickerStyle())
            }
            
            Section {
                Toggle(isOn: $attackItem) {
                    Text("Objet d'attaque")
                }
                
                if attackItem {
                    Stepper("Force d'attaque : \(attackStrength ?? 0)", value: Binding<Int>(
                        get: { self.attackStrength ?? 0 },
                        set: { self.attackStrength = $0 }
                    ), in: 0...100)
                }
            }
            
            Button(action: {
                if validateForm() {
                    addItem()
                    dismiss()
                } else {
                    showAlert = true
                }
            }, label: {
                Text("Ajouter")
            })
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Erreur"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
    }

    func validateForm() -> Bool {
        if name.isEmpty || name.count < 3 {
            alertMessage = "Le nom de l'objet doit faire au moins 3 caractères."
            return false
        }
        
        if type == .unknown {
            alertMessage = "Veuillez sélectionner un type valide."
            return false
        }
        
        if game == .emptyGame {
            alertMessage = "Veuillez sélectionner un jeu valide."
            return false
        }
        
        return true
    }
    
    func addItem() {
        inventory.addItem(item: LootItem(
            quantity: quantity,
            name: name,
            type: type,
            rarity: rarity,
            attackStrength: attackStrength,
            game: game
        ))
        dismiss()
    }
}
